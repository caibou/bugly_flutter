//
//  BuglyFlutterLogApiImpl.swift
//  bugly_flutter_ios
//
//  Created by kyros He on 2023/12/19.
//

import Bugly.BuglyLog
import Flutter


public class BuglyFlutterLogApiPlugin: NSObject, BuglyLogApi, FlutterPlugin {
    func initLogger(level: Int64, printConsole: Bool) throws {
        let bugLevel = BuglyLogLevel(rawValue: UInt(level)) ?? BuglyLogLevel.silent
        BuglyLog.initLogger(bugLevel, consolePrint: printConsole)
    }

    func log(level: Int64, tag: String, message: String) throws {
        let bugLevel = BuglyLogLevel(rawValue: UInt(level)) ?? BuglyLogLevel.silent
        let logMessage = String(format: "[%@] %@", tag, message);
        BuglyLog.level(bugLevel, logs: logMessage)
    }

    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = BuglyFlutterLogApiPlugin();
        registrar.publish(instance);
        BuglyLogApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance);
    }
}
