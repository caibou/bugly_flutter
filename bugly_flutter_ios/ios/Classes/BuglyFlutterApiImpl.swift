//
//  BuglyFlutterApiImpl.swift
//  bugly_flutter_ios
//
//  Created by zhengwenfeng on 2023/11/15.
//
import Bugly
import Flutter

public class BuglyFlutterApiPlugin: NSObject, BuglyApi, BuglyDelegate, FlutterPlugin {
    let localCrashLogKey = "BuglyLocalCrashLog";
    var previousCrasLog: String?;

    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = BuglyFlutterApiPlugin();
        registrar.publish(instance);
        BuglyApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
    }

    public func attachment(for exception: NSException?) -> String? {
        let log = stringify(exception: exception)
        UserDefaults.standard.setValue(log, forKey: localCrashLogKey)
        return "崩溃日志以存入设备本地"
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
        previousCrasLog = UserDefaults.standard.string(forKey: localCrashLogKey)
        UserDefaults.standard.removeObject(forKey: localCrashLogKey)
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

    func fetchCrashPreviousLaunch() throws -> String? {
        return previousCrasLog;
    }

    func stringify(exception: NSException?) -> String? {
        let formatter = DateFormatter()
        let exceptionInfo: [String: Any] = [
            "name": exception?.name.rawValue ?? "no name",
            "reason": exception?.reason ?? "No reason provided",
            "userInfo": stringifyUserInfo(userInfo: exception?.userInfo) ?? "no userInfo",
            "callStack": exception?.callStackSymbols ?? "no call stack",
            "crashTime": Date().timeIntervalSince1970
        ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: exceptionInfo, options: .prettyPrinted)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            print("Error converting exception to JSON: \(error)")
            return nil
        }
    }

    func stringifyUserInfo(userInfo: [AnyHashable : Any]?) -> String? {
        guard let userInfo = userInfo else {
            return nil
        }

        var dict = [String: Any]()

        for (key, value) in userInfo {
            dict[String(describing: key)] = value
        }

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            print("Error converting to JSON: \(error)")
            return nil
        }
    }
}
