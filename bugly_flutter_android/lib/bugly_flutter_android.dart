
import 'bugly_flutter_android_platform_interface.dart';

class BuglyFlutterAndroid {
  Future<String?> getPlatformVersion() {
    return BuglyFlutterAndroidPlatform.instance.getPlatformVersion();
  }
}
