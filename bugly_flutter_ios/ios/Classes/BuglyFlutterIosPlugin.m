#import "BuglyFlutterIosPlugin.h"
#import "bugly_flutter_ios-Swift.h"


@implementation BuglyFlutterIosPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [BuglyFlutterApiPlugin registerWithRegistrar:registrar];
    [BuglyFlutterLogApiPlugin registerWithRegistrar:registrar];
}

@end
