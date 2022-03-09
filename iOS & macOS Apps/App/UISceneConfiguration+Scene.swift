import UIKit
import Constants

extension UISceneConfiguration {
    
    enum Scene {
        
        case root
        case settings
        case expenseDetail(id: String)
        
        var id: String {
            switch self {
            case .root: return Constants.Scenes.root
            case .settings: return Constants.Scenes.settings
            case .expenseDetail: return Constants.Scenes.expenseDetail
            }
        }
    }
    
    convenience init(scene: Scene, role: UISceneSession.Role) {
        self.init(name: scene.id, sessionRole: role)
    }
}
