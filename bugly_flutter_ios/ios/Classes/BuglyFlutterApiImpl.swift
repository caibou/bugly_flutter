//
//  BuglyFlutterApiImpl.swift
//  bugly_flutter_ios
//
//  Created by zhengwenfeng on 2023/11/15.
//
import Bugly
import Flutter

public class BuglyFlutterApiPlugin: NSObject, BuglyApi, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = BuglyFlutterApiPlugin();
        registrar.publish(instance);
        BuglyApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
    }
    
    func startWithAppId(appId: String?, message: BuglyConfigMessage, isDevelopmentDevice: Bool) throws {
        let config = BuglyConfig();
        config.debugMode = message.debugMode;
        config.blockMonitorEnable = message.blockMonitorEnable;
        config.viewControllerTrackingEnable = message.pageTrackingEnable;
        
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
}
