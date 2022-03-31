import UIKit
import SparrowKit
import NativeUIKit
import Models

extension Presenter {
    
    enum Views {
        
        static func showDetailExample(on navigationController: UINavigationController) {
            let controller = ViewDetailController()
            navigationController.pushViewController(controller)
        }
    }
}
