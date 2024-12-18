// Autogenerated from Pigeon (v13.1.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated class from Pigeon that represents data sent in messages.
struct BuglyConfigMessage {
  var debugMode: Bool
  var channel: String? = nil
  var version: String? = nil
  var deviceIdentifier: String? = nil
  var pageTrackingEnable: Bool
  var blockMonitorEnable: Bool

  static func fromList(_ list: [Any?]) -> BuglyConfigMessage? {
    let debugMode = list[0] as! Bool
    let channel: String? = nilOrValue(list[1])
    let version: String? = nilOrValue(list[2])
    let deviceIdentifier: String? = nilOrValue(list[3])
    let pageTrackingEnable = list[4] as! Bool
    let blockMonitorEnable = list[5] as! Bool

    return BuglyConfigMessage(
      debugMode: debugMode,
      channel: channel,
      version: version,
      deviceIdentifier: deviceIdentifier,
      pageTrackingEnable: pageTrackingEnable,
      blockMonitorEnable: blockMonitorEnable
    )
  }
  func toList() -> [Any?] {
    return [
      debugMode,
      channel,
      version,
      deviceIdentifier,
      pageTrackingEnable,
      blockMonitorEnable,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct BuglyCrashInfoMessage {
  var crashTime: Int64
  var crashLog: String

  static func fromList(_ list: [Any?]) -> BuglyCrashInfoMessage? {
    let crashTime = list[0] is Int64 ? list[0] as! Int64 : Int64(list[0] as! Int32)
    let crashLog = list[1] as! String

    return BuglyCrashInfoMessage(
      crashTime: crashTime,
      crashLog: crashLog
    )
  }
  func toList() -> [Any?] {
    return [
      crashTime,
      crashLog,
    ]
  }
}
private class BuglyApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return BuglyConfigMessage.fromList(self.readValue() as! [Any?])
      case 129:
        return BuglyCrashInfoMessage.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class BuglyApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? BuglyConfigMessage {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? BuglyCrashInfoMessage {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class BuglyApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return BuglyApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return BuglyApiCodecWriter(data: data)
  }
}

class BuglyApiCodec: FlutterStandardMessageCodec {
  static let shared = BuglyApiCodec(readerWriter: BuglyApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol BuglyApi {
  func startWithAppId(appId: String?, message: BuglyConfigMessage, isDevelopmentDevice: Bool) throws
  func setUserIdentifier(userId: String) throws
  func setUserValue(key: String, value: String) throws
  func setTag(tag: Int64) throws
  func reportException(code: Int64, reason: String) throws
  func reportError(code: Int64, errorMesssage: String) throws
  func deviceId() throws -> String
  func fetchCrashPreviousLaunch() throws -> BuglyCrashInfoMessage?
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class BuglyApiSetup {
  /// The codec used by BuglyApi.
  static var codec: FlutterStandardMessageCodec { BuglyApiCodec.shared }
  /// Sets up an instance of `BuglyApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: BuglyApi?) {
    let startWithAppIdChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.startWithAppId", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      startWithAppIdChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let appIdArg: String? = nilOrValue(args[0])
        let messageArg = args[1] as! BuglyConfigMessage
        let isDevelopmentDeviceArg = args[2] as! Bool
        do {
          try api.startWithAppId(appId: appIdArg, message: messageArg, isDevelopmentDevice: isDevelopmentDeviceArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      startWithAppIdChannel.setMessageHandler(nil)
    }
    let setUserIdentifierChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.setUserIdentifier", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setUserIdentifierChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let userIdArg = args[0] as! String
        do {
          try api.setUserIdentifier(userId: userIdArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setUserIdentifierChannel.setMessageHandler(nil)
    }
    let setUserValueChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.setUserValue", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setUserValueChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        let valueArg = args[1] as! String
        do {
          try api.setUserValue(key: keyArg, value: valueArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setUserValueChannel.setMessageHandler(nil)
    }
    let setTagChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.setTag", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setTagChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let tagArg = args[0] is Int64 ? args[0] as! Int64 : Int64(args[0] as! Int32)
        do {
          try api.setTag(tag: tagArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setTagChannel.setMessageHandler(nil)
    }
    let reportExceptionChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.reportException", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      reportExceptionChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let codeArg = args[0] is Int64 ? args[0] as! Int64 : Int64(args[0] as! Int32)
        let reasonArg = args[1] as! String
        do {
          try api.reportException(code: codeArg, reason: reasonArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      reportExceptionChannel.setMessageHandler(nil)
    }
    let reportErrorChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.reportError", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      reportErrorChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let codeArg = args[0] is Int64 ? args[0] as! Int64 : Int64(args[0] as! Int32)
        let errorMesssageArg = args[1] as! String
        do {
          try api.reportError(code: codeArg, errorMesssage: errorMesssageArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      reportErrorChannel.setMessageHandler(nil)
    }
    let deviceIdChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.deviceId", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      deviceIdChannel.setMessageHandler { _, reply in
        do {
          let result = try api.deviceId()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      deviceIdChannel.setMessageHandler(nil)
    }
    let fetchCrashPreviousLaunchChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.fetchCrashPreviousLaunch", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      fetchCrashPreviousLaunchChannel.setMessageHandler { _, reply in
        do {
          let result = try api.fetchCrashPreviousLaunch()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      fetchCrashPreviousLaunchChannel.setMessageHandler(nil)
    }
  }
}
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol BuglyLogApi {
  func initLogger(level: Int64, printConsole: Bool) throws
  func log(level: Int64, tag: String, message: String) throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class BuglyLogApiSetup {
  /// The codec used by BuglyLogApi.
  /// Sets up an instance of `BuglyLogApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: BuglyLogApi?) {
    let initLoggerChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.bugly_flutter_ios.BuglyLogApi.initLogger", binaryMessenger: binaryMessenger)
    if let api = api {
      initLoggerChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let levelArg = args[0] is Int64 ? args[0] as! Int64 : Int64(args[0] as! Int32)
        let printConsoleArg = args[1] as! Bool
        do {
          try api.initLogger(level: levelArg, printConsole: printConsoleArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      initLoggerChannel.setMessageHandler(nil)
    }
    let logChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.bugly_flutter_ios.BuglyLogApi.log", binaryMessenger: binaryMessenger)
    if let api = api {
      logChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let levelArg = args[0] is Int64 ? args[0] as! Int64 : Int64(args[0] as! Int32)
        let tagArg = args[1] as! String
        let messageArg = args[2] as! String
        do {
          try api.log(level: levelArg, tag: tagArg, message: messageArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      logChannel.setMessageHandler(nil)
    }
  }
}
