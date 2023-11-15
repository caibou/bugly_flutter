import 'package:flutter_test/flutter_test.dart';
import 'package:bugly_flutter_android/bugly_flutter_android.dart';
import 'package:bugly_flutter_android/bugly_flutter_android_platform_interface.dart';
import 'package:bugly_flutter_android/bugly_flutter_android_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBuglyFlutterAndroidPlatform
    with MockPlatformInterfaceMixin
    implements BuglyFlutterAndroidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BuglyFlutterAndroidPlatform initialPlatform = BuglyFlutterAndroidPlatform.instance;

  test('$MethodChannelBuglyFlutterAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBuglyFlutterAndroid>());
  });

  test('getPlatformVersion', () async {
    BuglyFlutterAndroid buglyFlutterAndroidPlugin = BuglyFlutterAndroid();
    MockBuglyFlutterAndroidPlatform fakePlatform = MockBuglyFlutterAndroidPlatform();
    BuglyFlutterAndroidPlatform.instance = fakePlatform;

    expect(await buglyFlutterAndroidPlugin.getPlatformVersion(), '42');
  });
}
