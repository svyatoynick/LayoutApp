import UIKit
import Texts
import SPSafeSymbols

struct BarRowModel {
    
    let id: String
    let title: String
    let image: UIImage
    
    var getController: (() -> UIViewController)
    
    init(id: String, title: String, image: UIImage, getController: @escaping (() -> UIViewController)) {
        self.id = id
        self.title = title
        self.image = image
        self.getController = getController
    }
    
    enum Item: String, CaseIterable {
        
        case views
        case settings
        
        var id: String { return rawValue }
        
        var title: String {
            switch self {
            case .views: return Texts.Views.title
            case .settings: return Texts.App.Settings.title
            }
        }
        
        var image: UIImage {
            switch self {
            case .views: return .init(SPSafeSymbol.rectangle.insetFilled)
            case .settings: return .init(SPSafeSymbol.gearshape.fill)
            }
        }
        
        var controller: UIViewController {
            switch self {
            case .views: return Controllers.Views.home
            case .settings: return Controllers.App.Settings.home
            }
        }
    }
}
