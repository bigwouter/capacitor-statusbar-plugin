#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

CAP_PLUGIN(IosStatusBarTransparencyPlugin, "IosStatusBarTransparency",
           CAP_PLUGIN_METHOD(enableTransparency, CAPPluginReturnPromise);
)
