import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/bugly_api.g.dart',
  swiftOut: 'ios/Classes/GeneratorBuglyApi.g.swift',
))
class BuglyConfigMessage {
  final bool debugMode;
  final String? channel;
  final String? version;
  final String? deviceIdentifier;
  final bool pageTrackingEnable;
  final bool blockMonitorEnable;

  BuglyConfigMessage(
    this.debugMode,
    this.channel,
    this.version,
    this.deviceIdentifier,
    this.pageTrackingEnable,
    this.blockMonitorEnable,
  );
}

@HostApi()
abstract class BuglyApi {
  void startWithAppId(
      String? appId, BuglyConfigMessage message, bool isDevelopmentDevice);
  void setUserIdentifier(String userId);
  void setUserValue(String key, String value);
  void setTag(int tag);
  void reportException(int code, String reason);
  void reportError(int code, String errorMesssage);
  String deviceId();
  String? fetchCrashPreviousLaunch();
}

@HostApi()
abstract class BuglyLogApi {
  void initLogger(int level, bool printConsole);
  void log(int level, String tag, String message);
}
