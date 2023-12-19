import 'package:bugly_flutter/bugly_flutter.dart';

/// Bugly 日志
class B {
  static Future<void> verbose({String? tag, String? message}) =>
      Bugly.log(BuglyLogLevelType.verbose, tag: tag, message: message);

  static Future<void> debug({String? tag, String? message}) =>
      Bugly.log(BuglyLogLevelType.debug, tag: tag, message: message);

  static Future<void> info({String? tag, String? message}) =>
      Bugly.log(BuglyLogLevelType.info, tag: tag, message: message);

  static Future<void> warn({String? tag, String? message}) =>
      Bugly.log(BuglyLogLevelType.warn, tag: tag, message: message);

  static Future<void> error({String? tag, String? message}) =>
      Bugly.log(BuglyLogLevelType.error, tag: tag, message: message);
}
