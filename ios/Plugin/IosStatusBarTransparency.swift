import Foundation
import Capacitor

@objc(IosStatusBarTransparencyPlugin)
public class IosStatusBarTransparencyPlugin: CAPPlugin {

    @objc func enableTransparency(_ call: CAPPluginCall) {
        DispatchQueue.main.async { [weak self] in
            guard let bridge = self?.bridge else {
                call.reject("Capacitor bridge is unavailable")
                return
            }

            // Forces iOS to let the WebView bleed directly under the status bar bounds
            if #available(iOS 11.0, *) {
                bridge.webView?.scrollView.contentInsetAdjustmentBehavior = .never
            }

            // Clear out any background styling forced by the wrapper view
            bridge.viewController?.view.backgroundColor = .clear
            bridge.webView?.backgroundColor = .clear
            bridge.webView?.isOpaque = false

            call.resolve([
                "status": "success",
                "message": "iOS status bar transparency unlocked."
            ])
        }
    }
}
