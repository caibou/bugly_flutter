class BuglyConfig {
  final bool debugMode; // SDK Debug信息开关, 默认关闭
  final String? channel; // 设置自定义渠道标识
  final String? version; // 设置自定义版本号
  final String? deviceIdentifier; // 设置自定义设备唯一标识
  final bool pageTrackingEnable; // 页面信息记录开关，默认开启
  final bool blockMonitorEnable; // 卡顿监控开关，默认关闭

  const BuglyConfig({
    this.debugMode = false,
    this.channel,
    this.version,
    this.deviceIdentifier,
    this.pageTrackingEnable = true,
    this.blockMonitorEnable = false,
  });
}
