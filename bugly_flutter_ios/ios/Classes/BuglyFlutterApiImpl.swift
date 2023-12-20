//
//  BuglyFlutterApiImpl.swift
//  bugly_flutter_ios
//
//  Created by zhengwenfeng on 2023/11/15.
//
import Bugly
import Flutter
import SwiftyJSON

public class BuglyFlutterApiPlugin: NSObject, BuglyApi, BuglyDelegate, FlutterPlugin {
    let localCrashLogKey = "BuglyLocalCrashLog";
    var previousCrasLog: BuglyCrashInfoMessage?;

    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = BuglyFlutterApiPlugin();
        registrar.publish(instance);
        BuglyApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
        print(UserDefaults.standard.dictionaryRepresentation())
    }

    public func attachment(for exception: NSException?) -> String? {
        let log = convertExceptionToJson(exception: exception)
        UserDefaults.standard.setValue(log, forKey: localCrashLogKey)
        return nil
    }

    func startWithAppId(appId: String?, message: BuglyConfigMessage, isDevelopmentDevice: Bool) throws {
        let config = BuglyConfig();
        config.debugMode = message.debugMode;
        config.blockMonitorEnable = message.blockMonitorEnable;
        config.viewControllerTrackingEnable = message.pageTrackingEnable;

        // 非正常退出事件记录开关
        config.unexpectedTerminatingDetectionEnable = true;
        // 崩溃时候出发 attachment 回调
        config.delegate = self;

        if let value = message.version {
            config.version = value
        }

        if let value = message.deviceIdentifier {
            config.deviceIdentifier = value
        }

        if let value = message.channel {
            config.channel = value
        }

        Bugly.start(withAppId: appId, developmentDevice: isDevelopmentDevice, config: config)

        // 获取上次崩溃信息
        if let crashInfoJsonString = UserDefaults.standard.object(forKey: localCrashLogKey) as? String {
            let crashInfo = JSON(parseJSON: crashInfoJsonString)
            let dict = crashInfo.dictionaryValue;
            if let crashTime = dict["crashTime"]?.double, let crashLog = dict["crashLog"]?.rawString() {
                previousCrasLog = BuglyCrashInfoMessage(crashTime: Int64(crashTime), crashLog: crashLog)
                UserDefaults.standard.removeObject(forKey: localCrashLogKey)
            }
        }

    }
    
    func setUserIdentifier(userId: String) throws {
        Bugly.setUserIdentifier(userId)
    }
    
    func setUserValue(key: String, value: String) throws {
        Bugly.setUserValue(value, forKey: key)
    }
    
    func setTag(tag: Int64) throws {
        Bugly.setTag(UInt(tag))
    }
    
    func reportException(code: Int64, reason: String) throws {
        Bugly.report(NSException(name: NSExceptionName("\(code)"), reason: reason))
    }
    
    func reportError(code: Int64, errorMesssage: String) throws {
        Bugly.reportError(NSError(domain: errorMesssage, code: Int(code)))
    }
    
    func deviceId() throws -> String {
        return Bugly.buglyDeviceId();
    }

    func fetchCrashPreviousLaunch() throws -> BuglyCrashInfoMessage? {
        return previousCrasLog;
    }

    func convertExceptionToJson(exception: NSException?) -> String? {
        let exceptionInfo: [String: Any?] = [
            "name": exception?.name.rawValue,
            "reason": exception?.reason,
            "userInfo": stringifyUserInfo(userInfo: exception?.userInfo),
            "callStack": exception?.callStackSymbols,
        ]
        let crashLog = JSON(exceptionInfo)
        let crashTime = Date().timeIntervalSince1970
        let crashMessage: [String: Any] = [
            "crashTime": crashTime,
            "crashLog": crashLog,
        ]
        return JSON(crashMessage).rawString()
    }

    func stringifyUserInfo(userInfo: [AnyHashable: Any]?) -> String? {
        guard let userInfo = userInfo else {
            return nil
        }
        var dict = [String: Any]()
        for (key, value) in userInfo {
            dict[String(describing: key)] = value
        }
        return JSON(dict).rawString()
    }
}
