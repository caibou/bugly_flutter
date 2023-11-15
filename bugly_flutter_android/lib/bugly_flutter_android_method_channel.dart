import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bugly_flutter_android_platform_interface.dart';

/// An implementation of [BuglyFlutterAndroidPlatform] that uses method channels.
class MethodChannelBuglyFlutterAndroid extends BuglyFlutterAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bugly_flutter_android');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
