import Foundation

/// Browser rendering engine used for newly-created browser panes.
public enum BrowserEngineMode: String, CaseIterable, Sendable, SettingCodable {
    case webkit
    case chromium
}
