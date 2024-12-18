import 'package:bugly_flutter_ios/src/bugly_api.g.dart';
import 'package:bugly_flutter_platform_interface/bugly_flutter_platform_interface.dart';

class BuglyFlutterIos extends BuglyPlatform {
  final BuglyApi _api = BuglyApi();
  final BuglyLogApi _logApi = BuglyLogApi();

  static void registerWith() {
    BuglyPlatform.instance = BuglyFlutterIos();
  }

  @override
  Future<String> deviceId() => _api.deviceId();

  @override
  Future<void> setTag(int tag) => _api.setTag(tag);

  @override
  Future<void> setUserIdentifier(String userId) =>
      _api.setUserIdentifier(userId);

  @override
  Future<void> setUserValue(String key, String value) =>
      _api.setUserValue(key, value);

  @override
  Future<void> startWithAppId({
    String? appId,
    BuglyConfig buglyConfig = const BuglyConfig(),
    bool isDevelopmentDevice = false,
  }) {
    BuglyConfigMessage message = BuglyConfigMessage(
      debugMode: buglyConfig.debugMode,
      channel: buglyConfig.channel,
      version: buglyConfig.version,
      deviceIdentifier: buglyConfig.deviceIdentifier,
      pageTrackingEnable: buglyConfig.pageTrackingEnable,
      blockMonitorEnable: buglyConfig.blockMonitorEnable,
    );
    return _api.startWithAppId(appId, message, isDevelopmentDevice);
  }

  @override
  Future<void> reportError(int code, String errorMesssage) =>
      _api.reportError(code, errorMesssage);

  @override
  Future<void> reportException(int code, String errorMessage) =>
      _api.reportException(code, errorMessage);

  @override
  Future<void> initLogger(BuglyLogLevelType level, bool printConsole) =>
      _logApi.initLogger(level.index, printConsole);

  @override
  Future<void> log(BuglyLogLevelType level, String tag, String message) =>
      _logApi.log(level.index, tag, message);

  @override
  Future<BuglyCrashInfo?> fetchCrashPreviousLaunch() async {
    final buglyCrashInfo = await _api.fetchCrashPreviousLaunch();
    if (buglyCrashInfo != null) {
      return BuglyCrashInfo(
        buglyCrashInfo.crashTime,
        buglyCrashInfo.crashLog,
      );
    } else {
      return null;
    }
  }
}
