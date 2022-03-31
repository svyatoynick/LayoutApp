import UIKit
import NativeUIKit
import SparrowKit

class ViewDetailController: SPController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presentModal()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        detailViewController.dismiss(animated: true)
    }
    
    let detailViewController = UIViewController()
    
    // move to detail
    private func presentModal() {
        
        detailViewController.view.backgroundColor = .systemBackground
        let nav = UINavigationController(rootViewController: detailViewController)
        nav.isModalInPresentation = true
        nav.modalPresentationStyle = .pageSheet
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.largestUndimmedDetentIdentifier = .medium
        }
        present(nav, animated: true, completion: nil)
    }
}
