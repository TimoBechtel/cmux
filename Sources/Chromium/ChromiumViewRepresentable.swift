import SwiftUI
import AppKit

struct ChromiumViewRepresentable: NSViewRepresentable {
    @ObservedObject var panel: BrowserPanel
    let shouldAcceptContentFocusEvents: Bool
    let shouldFocusWebView: Bool
    let isPanelFocused: Bool
    let searchOverlay: BrowserPortalSearchOverlayConfiguration?

    func makeNSView(context: Context) -> ChromiumBrowserHostView {
        panel.chromiumContentView()
    }

    func updateNSView(_ nsView: ChromiumBrowserHostView, context: Context) {
        nsView.acceptsContentFocusEvents = shouldAcceptContentFocusEvents
        nsView.setSearchOverlay(searchOverlay)
        nsView.needsLayout = true
        nsView.layoutSubtreeIfNeeded()
        if nsView.window != nil {
            panel.releaseChromiumBackgroundPreloadHostIfAttachedToRealWindow(reason: "representable.update")
        }
        if shouldFocusWebView {
            nsView.focusBrowserContent()
        } else if !isPanelFocused {
            nsView.clearBrowserContentFocus()
        }
    }
}
