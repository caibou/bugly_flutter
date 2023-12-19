import 'package:bugly_flutter_platform_interface/bugly_flutter_platform_interface.dart';

class Bugly {
  Bugly._();

  static final _instance = BuglyPlatform.instance;

  static Future<void> startWithAppId({
    String? appId,
    BuglyConfig buglyConfig = const BuglyConfig(),
    bool isDevelopmentDevice = false,
  }) =>
      _instance.startWithAppId(
          appId: appId,
          buglyConfig: buglyConfig,
          isDevelopmentDevice: isDevelopmentDevice);

  static Future<void> setUserIdentifier(String userId) =>
      _instance.setUserIdentifier(userId);

  static Future<void> setUserValue(String key, String value) =>
      _instance.setUserValue(key, value);

  static Future<void> setTag(int tag) => _instance.setTag(tag);

  static Future<void> reportException(int code, String errorMessage) =>
      _instance.reportException(code, errorMessage);

  static Future<void> reportError(int code, String errorMesssage) =>
      _instance.reportError(code, errorMesssage);

  static Future<String> deviceId() => _instance.deviceId();

  static Future<String?> fetchCrashPreviousLaunch() =>
      _instance.fetchCrashPreviousLaunch();

  static Future<void> initLogger(BuglyLogLevelType level, bool printConsole) =>
      _instance.initLogger(level, printConsole);

  static Future<void> log(
    BuglyLogLevelType level, {
    String? tag,
    String? message,
  }) =>
      _instance.log(level, tag ?? 'undefinedTag', message ?? '');
}
