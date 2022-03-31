import UIKit
import SPDiffable
import Texts
import NativeUIKit

class ViewsHomeController: SPDiffableTableController {
    
    // MARK: - Init
    
    init() {
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Texts.Views.title
        
        tableView.register(NativeLeftButtonTableViewCell.self)
        tableView.register(ViewHeaderTableCell.self)
        
        configureDiffable(
            sections: content,
            cellProviders: [.viewHeader, .button] + SPDiffableTableDataSource.CellProvider.default,
            headerFooterProviders: [.largeHeader]
        )
    }
    
    // MARK: - Data
    
    internal var viewItems: [ViewItem] {
        [
            .init(
                title: "UIButton",
                footer: "A control that executes your custom code in response to user interactions.",
                editors: [
                    .init(title: "Content Edge Insets", action: {
                        guard let navigationController = self.navigationController else { return }
                        Presenter.Views.showDetailExample(on: navigationController)
                    }),
                    .init(title: "Image & Title Edge Insets", action: {
                        guard let navigationController = self.navigationController else { return }
                        Presenter.Views.showDetailExample(on: navigationController)
                    })
                ]
            ),
            .init(
                title: "UITableViewCell",
                footer: "The visual representation of a single row in a table view.",
                editors: [
                    .init(title: "Layout Margins", action: {
                        guard let navigationController = self.navigationController else { return }
                        Presenter.Views.showDetailExample(on: navigationController)
                    })
                ]
            ),
            .init(
                title: "UICollectionViewCell",
                footer: "A single data item when that item is within the collection view’s visible bounds.",
                editors: [
                    .init(title: "Layout Margins", action: {
                        guard let navigationController = self.navigationController else { return }
                        Presenter.Views.showDetailExample(on: navigationController)
                    })
                ]
            ),
            .init(
                title: "UITextField",
                footer: "A single data item when that item is within the collection view’s visible bounds.",
                editors: [
                    .init(title: "Text Rect", action: {
                        guard let navigationController = self.navigationController else { return }
                        Presenter.Views.showDetailExample(on: navigationController)
                    }),
                    .init(title: "Placeholder Rect", action: {
                        guard let navigationController = self.navigationController else { return }
                        Presenter.Views.showDetailExample(on: navigationController)
                    }),
                    .init(title: "Editing Rect", action: {
                        guard let navigationController = self.navigationController else { return }
                        Presenter.Views.showDetailExample(on: navigationController)
                    }),
                    .init(title: "Clear Button Rect", action: {
                        guard let navigationController = self.navigationController else { return }
                        Presenter.Views.showDetailExample(on: navigationController)
                    })
                ]
            ),
        ]
    }
    
    // MARK: - Diffable
    
    internal var content: [SPDiffableSection] {
        var sections: [SPDiffableSection] = []
        for viewItem in viewItems {
            let headerItem = ViewHeaderDiffableItem(id: viewItem.title, title: viewItem.title)
            let editItems = viewItem.editors.map({ editor in
                return NativeDiffableLeftButton(
                    id: viewItem.title + editor.title,
                    text: editor.title,
                    textColor: .tint,
                    accessoryType: .disclosureIndicator,
                    action: { _, _ in editor.action() }
                )
            })
            let section = SPDiffableSection(
                id: viewItem.title,
                header: nil,
                footer: SPDiffableTextHeaderFooter(text: viewItem.footer),
                items: [headerItem] + editItems
            )
            sections.append(section)
        }
        return sections
    }
    
    // MARK: - Models
    
    struct ViewItem {
        
        var title: String
        var footer: String
        var editors: [EditorItem]
    }
    
    struct EditorItem {
        
        var title: String
        var action: ()->Void
    }
}
