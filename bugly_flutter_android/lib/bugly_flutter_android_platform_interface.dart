import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bugly_flutter_android_method_channel.dart';

abstract class BuglyFlutterAndroidPlatform extends PlatformInterface {
  /// Constructs a BuglyFlutterAndroidPlatform.
  BuglyFlutterAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static BuglyFlutterAndroidPlatform _instance = MethodChannelBuglyFlutterAndroid();

  /// The default instance of [BuglyFlutterAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelBuglyFlutterAndroid].
  static BuglyFlutterAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BuglyFlutterAndroidPlatform] when
  /// they register themselves.
  static set instance(BuglyFlutterAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
