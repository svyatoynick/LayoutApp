import UIKit
import SparrowKit
import SPProfiling
import Models
import Logic

import SPPermissions
import SPPermissionsNotification

@main
class AppDelegate: SPAppScenesDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        SPLogger.configure(levels: SPLogger.Level.allCases, fileNameMode: .show)
        
        //ProfileModel.currentProfile?.signOut { _ in }
        
        LogicService.configure()
        
        
        #warning("move to somewhere")
        UIApplication.shared.registerForRemoteNotifications()
        SPPermissions.Permission.notification.request {}
        
        return true
    }
    
    // MARK: - Scenes
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let activity = options.userActivities.first
        debug("Creating new scene for activity type \(String(describing: activity?.activityType))")
        let sceneActivity = activity as? SceneUserActivity
        return UISceneConfiguration(scene: sceneActivity?.scene ?? .root, role: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        sceneSessions.forEach({
            debug("Discard scene with configuration name: \(String(describing: $0.configuration.name ?? "Haven't name"))")
        })
    }
}

