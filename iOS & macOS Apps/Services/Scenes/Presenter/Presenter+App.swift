import UIKit
import SparrowKit
import NativeUIKit
import Models

extension Presenter {
    
    enum App {
        
        static func showOnboarding(on viewController: UIViewController) {
            let controller = Controllers.App.Onboarding.container
            applyForm(.modalForm, to: controller)
            viewController.present(controller)
        }
        
        static func showSettings(on viewController: UIViewController) {
            let controller = Controllers.App.Settings.home
            let navigationController = controller.wrapToNavigationController(prefersLargeTitles: true)
            applyForm(.fullScreen, to: navigationController)
            viewController.present(navigationController)
        }
    }
}
