import Foundation
import Capacitor

@objc(IosStatusBarTransparencyPlugin)
public class IosStatusBarTransparencyPlugin: CAPPlugin, CAPBridgedPlugin {
    // Registration that replaces the Objective-C CAP_PLUGIN macro,
    // so the plugin can be built with Swift Package Manager (Swift-only targets)
    public let identifier = "IosStatusBarTransparencyPlugin"
    public let jsName = "IosStatusBarTransparency"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(#selector(enableTransparency(_:)), returnType: .promise)
    ]

    @objc func enableTransparency(_ call: CAPPluginCall) {
        DispatchQueue.main.async { [weak self] in
            guard
                let bridge = self?.bridge,
                let webView = bridge.webView,
                let viewController = bridge.viewController
            else {
                call.reject("Capacitor bridge is unavailable")
                return
            }

            // Stop iOS from pushing the web content below the status bar
            if #available(iOS 11.0, *) {
                webView.scrollView.contentInsetAdjustmentBehavior = .never
            }

            // Stretch the view controller and the web view over the full screen,
            // including the status bar area, so the page shows through it
            let screenBounds = viewController.view.window?.bounds ?? UIScreen.main.bounds
            viewController.view.frame = screenBounds
            webView.frame = screenBounds

            // Clear out any background styling forced by the wrapper view
            viewController.view.backgroundColor = .clear
            webView.backgroundColor = .clear
            webView.isOpaque = false

            // Optional "light" or "dark" to set the status bar text colour
            switch call.getString("style", "default") {
            case "light":
                bridge.statusBarStyle = .lightContent
            case "dark":
                bridge.statusBarStyle = .darkContent
            default:
                bridge.statusBarStyle = .default
            }
            viewController.setNeedsStatusBarAppearanceUpdate()

            call.resolve([
                "status": "success",
                "message": "iOS status bar transparency unlocked."
            ])
        }
    }
}
