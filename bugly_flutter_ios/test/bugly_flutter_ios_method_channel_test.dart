import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bugly_flutter_ios/bugly_flutter_ios_method_channel.dart';

void main() {
  MethodChannelBuglyFlutterIos platform = MethodChannelBuglyFlutterIos();
  const MethodChannel channel = MethodChannel('bugly_flutter_ios');

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
