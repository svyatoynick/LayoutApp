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
        case frames
        case autoLayout
        case controllers
        case settings
        
        var id: String { return rawValue }
        
        var title: String {
            switch self {
            case .views: return Texts.Views.title
            case .frames: return Texts.Frames.title
            case .autoLayout: return Texts.AutoLayout.title
            case .controllers: return Texts.Controllers.title
            case .settings: return Texts.App.Settings.title
            }
        }
        
        var image: UIImage {
            switch self {
            case .views: return .init(SPSafeSymbol.rectangle.insetFilled)
            case .frames: return .init(SPSafeSymbol.rectangle.insetFilled)
            case .autoLayout: return .init(SPSafeSymbol.rectangle.insetFilled)
            case .controllers: return .init(SPSafeSymbol.rectangle.insetFilled)
            case .settings: return .init(SPSafeSymbol.gearshape.fill)
            }
        }
        
        var controller: UIViewController {
            switch self {
            case .views: return Controllers.Views.home
            case .frames: return Controllers.Frames.home
            case .autoLayout: return Controllers.AutoLayout.home
            case .controllers: return Controllers.Controllers.home
            case .settings: return Controllers.App.Settings.home
            }
        }
    }
}
