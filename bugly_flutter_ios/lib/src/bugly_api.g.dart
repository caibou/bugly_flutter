// Autogenerated from Pigeon (v13.1.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

class BuglyConfigMessage {
  BuglyConfigMessage({
    required this.debugMode,
    this.channel,
    this.version,
    this.deviceIdentifier,
    required this.pageTrackingEnable,
    required this.blockMonitorEnable,
  });

  bool debugMode;

  String? channel;

  String? version;

  String? deviceIdentifier;

  bool pageTrackingEnable;

  bool blockMonitorEnable;

  Object encode() {
    return <Object?>[
      debugMode,
      channel,
      version,
      deviceIdentifier,
      pageTrackingEnable,
      blockMonitorEnable,
    ];
  }

  static BuglyConfigMessage decode(Object result) {
    result as List<Object?>;
    return BuglyConfigMessage(
      debugMode: result[0]! as bool,
      channel: result[1] as String?,
      version: result[2] as String?,
      deviceIdentifier: result[3] as String?,
      pageTrackingEnable: result[4]! as bool,
      blockMonitorEnable: result[5]! as bool,
    );
  }
}

class BuglyCrashInfoMessage {
  BuglyCrashInfoMessage({
    required this.crashTime,
    required this.crashLog,
  });

  int crashTime;

  String crashLog;

  Object encode() {
    return <Object?>[
      crashTime,
      crashLog,
    ];
  }

  static BuglyCrashInfoMessage decode(Object result) {
    result as List<Object?>;
    return BuglyCrashInfoMessage(
      crashTime: result[0]! as int,
      crashLog: result[1]! as String,
    );
  }
}

class _BuglyApiCodec extends StandardMessageCodec {
  const _BuglyApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is BuglyConfigMessage) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is BuglyCrashInfoMessage) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return BuglyConfigMessage.decode(readValue(buffer)!);
      case 129: 
        return BuglyCrashInfoMessage.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class BuglyApi {
  /// Constructor for [BuglyApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  BuglyApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _BuglyApiCodec();

  Future<void> startWithAppId(String? arg_appId, BuglyConfigMessage arg_message, bool arg_isDevelopmentDevice) async {
    const String channelName = 'dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.startWithAppId';
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
      channelName,
      codec,
      binaryMessenger: _binaryMessenger,
    );
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_appId, arg_message, arg_isDevelopmentDevice]) as List<Object?>?;
    if (replyList == null) {
      throw _createConnectionError(channelName);
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setUserIdentifier(String arg_userId) async {
    const String channelName = 'dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.setUserIdentifier';
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
      channelName,
      codec,
      binaryMessenger: _binaryMessenger,
    );
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_userId]) as List<Object?>?;
    if (replyList == null) {
      throw _createConnectionError(channelName);
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setUserValue(String arg_key, String arg_value) async {
    const String channelName = 'dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.setUserValue';
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
      channelName,
      codec,
      binaryMessenger: _binaryMessenger,
    );
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_key, arg_value]) as List<Object?>?;
    if (replyList == null) {
      throw _createConnectionError(channelName);
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setTag(int arg_tag) async {
    const String channelName = 'dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.setTag';
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
      channelName,
      codec,
      binaryMessenger: _binaryMessenger,
    );
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_tag]) as List<Object?>?;
    if (replyList == null) {
      throw _createConnectionError(channelName);
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reportException(int arg_code, String arg_reason) async {
    const String channelName = 'dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.reportException';
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
      channelName,
      codec,
      binaryMessenger: _binaryMessenger,
    );
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_code, arg_reason]) as List<Object?>?;
    if (replyList == null) {
      throw _createConnectionError(channelName);
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reportError(int arg_code, String arg_errorMesssage) async {
    const String channelName = 'dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.reportError';
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
      channelName,
      codec,
      binaryMessenger: _binaryMessenger,
    );
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_code, arg_errorMesssage]) as List<Object?>?;
    if (replyList == null) {
      throw _createConnectionError(channelName);
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<String> deviceId() async {
    const String channelName = 'dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.deviceId';
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
      channelName,
      codec,
      binaryMessenger: _binaryMessenger,
    );
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw _createConnectionError(channelName);
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as String?)!;
    }
  }

  Future<BuglyCrashInfoMessage?> fetchCrashPreviousLaunch() async {
    const String channelName = 'dev.flutter.pigeon.bugly_flutter_ios.BuglyApi.fetchCrashPreviousLaunch';
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
      channelName,
      codec,
      binaryMessenger: _binaryMessenger,
    );
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw _createConnectionError(channelName);
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as BuglyCrashInfoMessage?);
    }
  }
}

class BuglyLogApi {
  /// Constructor for [BuglyLogApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  BuglyLogApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = StandardMessageCodec();

  Future<void> initLogger(int arg_level, bool arg_printConsole) async {
    const String channelName = 'dev.flutter.pigeon.bugly_flutter_ios.BuglyLogApi.initLogger';
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
      channelName,
      codec,
      binaryMessenger: _binaryMessenger,
    );
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_level, arg_printConsole]) as List<Object?>?;
    if (replyList == null) {
      throw _createConnectionError(channelName);
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> log(int arg_level, String arg_tag, String arg_message) async {
    const String channelName = 'dev.flutter.pigeon.bugly_flutter_ios.BuglyLogApi.log';
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
      channelName,
      codec,
      binaryMessenger: _binaryMessenger,
    );
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_level, arg_tag, arg_message]) as List<Object?>?;
    if (replyList == null) {
      throw _createConnectionError(channelName);
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}
