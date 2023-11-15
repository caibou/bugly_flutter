class BuglyConfig {
  final bool debugMode;
  final String? channel;
  final String? version;
  final String? deviceIdentifier;
  final bool pageTrackingEnable;
  final bool blockMonitorEnable;

  const BuglyConfig({
    this.debugMode = false,
    this.channel,
    this.version,
    this.deviceIdentifier,
    this.pageTrackingEnable = true,
    this.blockMonitorEnable = false,
  });
}
