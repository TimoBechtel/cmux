import Bonsplit
import SwiftUI

struct BrowserEngineSurfaceView: View {
    let panel: BrowserPanel
    let paneId: PaneID
    let shouldAttachWebView: Bool
    let useLocalInlineHosting: Bool
    let shouldFocusWebView: Bool
    let isPanelFocused: Bool
    let portalZPriority: Int
    let paneDropZone: DropZone?
    let paneOwnershipOverride: Bool?
    let searchOverlay: BrowserPortalSearchOverlayConfiguration?
    let designComposer: BrowserPortalDesignComposerConfiguration?
    let omnibarSuggestions: BrowserPortalOmnibarSuggestionsConfiguration?
    let paneTopChromeHeight: CGFloat

    var body: some View {
        if panel.usesChromiumEngine {
            ChromiumViewRepresentable(
                panel: panel,
                shouldAcceptContentFocusEvents: shouldAttachWebView,
                shouldFocusWebView: shouldFocusWebView,
                isPanelFocused: isPanelFocused,
                searchOverlay: searchOverlay
            )
        } else {
            WebViewRepresentable(
                panel: panel,
                paneId: paneId,
                shouldAttachWebView: shouldAttachWebView,
                useLocalInlineHosting: useLocalInlineHosting,
                shouldFocusWebView: shouldFocusWebView,
                isPanelFocused: isPanelFocused,
                portalZPriority: portalZPriority,
                paneDropZone: paneDropZone,
                paneOwnershipOverride: paneOwnershipOverride,
                searchOverlay: searchOverlay,
                designComposer: designComposer,
                omnibarSuggestions: omnibarSuggestions,
                paneTopChromeHeight: paneTopChromeHeight
            )
        }
    }
}
