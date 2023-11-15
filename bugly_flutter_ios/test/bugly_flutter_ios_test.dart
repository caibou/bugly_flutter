import 'package:flutter_test/flutter_test.dart';
import 'package:bugly_flutter_ios/bugly_flutter_ios.dart';
import 'package:bugly_flutter_ios/bugly_flutter_ios_platform_interface.dart';
import 'package:bugly_flutter_ios/bugly_flutter_ios_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBuglyFlutterIosPlatform
    with MockPlatformInterfaceMixin
    implements BuglyFlutterIosPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BuglyFlutterIosPlatform initialPlatform = BuglyFlutterIosPlatform.instance;

  test('$MethodChannelBuglyFlutterIos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBuglyFlutterIos>());
  });

  test('getPlatformVersion', () async {
    BuglyFlutterIos buglyFlutterIosPlugin = BuglyFlutterIos();
    MockBuglyFlutterIosPlatform fakePlatform = MockBuglyFlutterIosPlatform();
    BuglyFlutterIosPlatform.instance = fakePlatform;

    expect(await buglyFlutterIosPlugin.getPlatformVersion(), '42');
  });
}
