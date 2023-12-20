import 'package:bugly_flutter_platform_interface/bugly_flutter_platform_interface.dart';
import 'package:bugly_flutter_platform_interface/src/types/bugly_crash_info.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../types/bugly_config.dart';

abstract class BuglyPlatform extends PlatformInterface {
  static final Object _token = Object();

  BuglyPlatform() : super(token: _token);

  static BuglyPlatform _instance = _Placeholder();

  static BuglyPlatform get instance => _instance;

  static set instance(BuglyPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<void> startWithAppId(
      {String? appId,
      BuglyConfig buglyConfig = const BuglyConfig(),
      bool isDevelopmentDevice = false});

  Future<void> setUserIdentifier(String userId);
  Future<void> setUserValue(String key, String value);
  Future<void> setTag(int tag);
  Future<void> reportException(int code, String errorMessage);
  Future<void> reportError(int code, String errorMesssage);
  Future<String> deviceId();
  Future<BuglyCrashInfo?> fetchCrashPreviousLaunch();

  Future<void> initLogger(BuglyLogLevelType level, bool printConsole);
  Future<void> log(BuglyLogLevelType level, String tag, String message);
}

class _Placeholder extends BuglyPlatform {
  @override
  Future<String> deviceId() {
    // TODO: implement deviceId
    throw UnimplementedError();
  }

  @override
  Future<void> setTag(int tag) {
    // TODO: implement setTag
    throw UnimplementedError();
  }

  @override
  Future<void> setUserIdentifier(String userId) {
    // TODO: implement setUserIdentifier
    throw UnimplementedError();
  }

  @override
  Future<void> setUserValue(String key, String value) {
    // TODO: implement setUserValue
    throw UnimplementedError();
  }

  @override
  Future<void> reportError(int code, String errorMesssage) {
    // TODO: implement reportError
    throw UnimplementedError();
  }

  @override
  Future<void> reportException(int code, String errorMessage) {
    // TODO: implement reportException
    throw UnimplementedError();
  }

  @override
  Future<void> startWithAppId(
      {String? appId,
      BuglyConfig buglyConfig = const BuglyConfig(),
      bool isDevelopmentDevice = false}) {
    // TODO: implement startWithAppId
    throw UnimplementedError();
  }

  @override
  Future<void> initLogger(BuglyLogLevelType level, bool printConsole) {
    // TODO: implement initLogger
    throw UnimplementedError();
  }

  @override
  Future<void> log(BuglyLogLevelType level, String tag, String message) {
    // TODO: implement log
    throw UnimplementedError();
  }

  @override
  Future<BuglyCrashInfo?> fetchCrashPreviousLaunch() {
    // TODO: implement fetchCrashPreviousLaunch
    throw UnimplementedError();
  }
}
