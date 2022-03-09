import UIKit
import SparrowKit
import Models

enum Navigation {
    
    // MARK: - Controllers
    
    static var rootController: UIViewController {
        return SideBarSplitController()
    }
    
    static var compactRootController: UIViewController {
        return TabBarController()
    }
    
    // MARK: - Bars
    
    static var tabBars: [BarRowModel] {
        return basicBars(for: .tabBar)
    }
    
    #warning("add child controllers")
    static var sideBars: [BarSectionModel] {
        return [
            BarSectionModel(.home, items: basicBars(for: .sideBar)),
            BarSectionModel(
                .views,
                items: []
                    /*HomeModel.currentHome?.stuffPlaces.prefix(4).map({ (model) -> BarRowModel in
                        return BarRowModel(
                            id: model.id,
                            title: model.name,
                            image: Images.SideAndTabBar.stuff,
                            getController: {
                                let placeDetailController = Controllers.Stuff.placeDetail(model)
                                let navigationController = createController(for: .stuff)
                                navigationController.popToRootViewController(animated: false)
                                navigationController.pushViewController(placeDetailController, animated: false)
                                return navigationController
                                
                            }
                        )
                    }) ?? []*/
            )
        ]
    }
    
    // MARK: - Internal
    
    private static func basicBars(for usage: BarUsage) -> [BarRowModel] {
        let barItems = BarRowModel.Item.allCases
        return barItems.map { (barItem) -> BarRowModel in
            let identifier = usage.id + barItem.id
            return BarRowModel.init(
                id: identifier,
                title: barItem.title,
                image: barItem.image,
                getController: {
                    if let controller = Cache.getController(by: identifier) {
                        return controller
                    } else {
                        let controller = createController(for: barItem)
                        if usage.allowCacheControllers {
                            Cache.appendController(controller, for: identifier)
                        }
                        return controller
                    }
                }
            )
        }
    }
    
    private static func createController(for barItem: BarRowModel.Item) -> UINavigationController {
        let controller = barItem.controller
        let allowLargeTitles = UIDevice.current.isMac ? false : true
        let navigationController = controller.wrapToNavigationController(prefersLargeTitles: allowLargeTitles)
        return navigationController
    }
}
