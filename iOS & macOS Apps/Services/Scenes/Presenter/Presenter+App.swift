import UIKit
import SparrowKit
import NativeUIKit
import Models

extension Presenter {
    
    enum App {
        
        static func showSettings(on viewController: UIViewController) {
            let controller = Controllers.App.Settings.home
            let navigationController = controller.wrapToNavigationController(prefersLargeTitles: true)
            applyForm(.fullScreen, to: navigationController)
            viewController.present(navigationController)
        }
    }
}
