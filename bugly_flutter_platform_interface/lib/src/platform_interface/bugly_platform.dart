import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../types/bugly_config.dart';

abstract class BuglyPlatform extends PlatformInterface {
  static final Object _token = Object();

  BuglyPlatform() : super(token: _token);

  static BuglyPlatform _instance = _Placeholder();

  static BuglyPlatform get instance => _instance;

  static set instance(BuglyPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<void> startWithAppId({String? appId, BuglyConfig buglyConfig = const BuglyConfig(), bool isDevelopmentDevice = false});

  Future<void> setUserIdentifier(String userId);
  Future<void> setUserValue(String key, String value);
  Future<void> setTag(int tag);
  Future<void> reportException(int code, String errorMessage);
  Future<void> reportError(int code, String errorMesssage);
  Future<String> deviceId();
}

class _Placeholder extends BuglyPlatform {
  @override
  Future<String> deviceId() {
    // TODO: implement deviceId
    throw UnimplementedError();
  }

  @override
  Future<void> setTag(int tag) {
    // TODO: implement setTag
    throw UnimplementedError();
  }

  @override
  Future<void> setUserIdentifier(String userId) {
    // TODO: implement setUserIdentifier
    throw UnimplementedError();
  }

  @override
  Future<void> setUserValue(String key, String value) {
    // TODO: implement setUserValue
    throw UnimplementedError();
  }

  @override
  Future<void> reportError(int code, String errorMesssage) {
    // TODO: implement reportError
    throw UnimplementedError();
  }

  @override
  Future<void> reportException(int code, String errorMessage) {
    // TODO: implement reportException
    throw UnimplementedError();
  }

  @override
  Future<void> startWithAppId({String? appId, BuglyConfig buglyConfig = const BuglyConfig(), bool isDevelopmentDevice = false}) {
    // TODO: implement startWithAppId
    throw UnimplementedError();
  }
}