import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bugly_flutter_android/bugly_flutter_android_method_channel.dart';

void main() {
  MethodChannelBuglyFlutterAndroid platform = MethodChannelBuglyFlutterAndroid();
  const MethodChannel channel = MethodChannel('bugly_flutter_android');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
