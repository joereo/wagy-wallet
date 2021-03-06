// Copyright SIX DAY LLC. All rights reserved.
import Foundation

class AppTracker {

    struct Keys {
        static let launchCountTotal = "launchCountTotal"
        static let launchCountForCurrentBuild = "launchCountForCurrentBuild-" + String(Bundle.main.buildNumberInt)
        static let completedSharing = "completedSharing"
        static let completedRating = "completedRating"
        static let completedPromptForNewsletter = "completedPromptForNewsletter"
    }

    let defaults: UserDefaults

    var launchCountTotal: Int {
        get { return defaults.integer(forKey: Keys.launchCountTotal) }
        set { return defaults.set(newValue, forKey: Keys.launchCountTotal) }
    }

    var launchCountForCurrentBuild: Int {
        get { return defaults.integer(forKey: Keys.launchCountForCurrentBuild) }
        set { return defaults.set(newValue, forKey: Keys.launchCountForCurrentBuild) }
    }

    var completedRating: Bool {
        get { return defaults.bool(forKey: Keys.completedRating) }
        set { return defaults.set(newValue, forKey: Keys.completedRating) }
    }

    var hasCompletedPromptForNewsletter: Bool {
        get { defaults.bool(forKey: Keys.completedPromptForNewsletter) }
        set { defaults.set(newValue, forKey: Keys.completedPromptForNewsletter) }
    }

    var completedSharing: Bool {
        get { return defaults.bool(forKey: Keys.completedSharing) }
        set { return defaults.set(newValue, forKey: Keys.completedSharing) }
    }

    init(
        defaults: UserDefaults = .standardOrForTests
    ) {
        self.defaults = defaults
    }

    func start() {
        launchCountTotal += launchCountTotal
        launchCountForCurrentBuild += 1
    }

    var description: String {
        return """
        launchCountTotal: \(launchCountTotal)
        launchCountForCurrentBuild: \(launchCountForCurrentBuild)
        completedRating: \(completedRating)
        completedSharing: \(completedSharing)
        completedPromptForNewsletter: \(hasCompletedPromptForNewsletter)
        """
    }
}
