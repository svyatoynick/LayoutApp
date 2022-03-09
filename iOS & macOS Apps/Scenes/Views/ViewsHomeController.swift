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
    
    // MARK: - Diffable
    
    internal enum Item: String {
        
        case uibutton
        case uitableviewcell
        case uicollectionviewcell
        case uitextfield
        
        var sectonID: String { "section" + rawValue }
        var itemID: String { "item" + rawValue }
    }
    
    
    internal var content: [SPDiffableSection] {
        [
            .init(
                id: Item.uibutton.sectonID,
                header: nil,
                footer: SPDiffableTextHeaderFooter(text: "A control that executes your custom code in response to user interactions."),
                items: [
                    ViewHeaderDiffableItem(id: Item.uibutton.itemID, title: "UIButton"),
                    NativeDiffableLeftButton(
                        id: Item.uibutton.itemID + "content_edge_insets",
                        text: "Content Edge Insets",
                        textColor: .tint,
                        accessoryType: .disclosureIndicator
                    ),
                    NativeDiffableLeftButton(
                        id: Item.uibutton.itemID + "image_title_edge_insets",
                        text: "Image & Title Edge Insets",
                        textColor: .tint,
                        accessoryType: .disclosureIndicator
                    )
                ]
            ),
            .init(
                id: Item.uitableviewcell.sectonID,
                header: nil,
                footer: SPDiffableTextHeaderFooter(text: "The visual representation of a single row in a table view."),
                items: [
                    ViewHeaderDiffableItem(id: Item.uitableviewcell.itemID, title: "UITableViewCell"),
                    NativeDiffableLeftButton(
                        id: Item.uitableviewcell.itemID + "layout_margins",
                        text: "Layout Margins",
                        textColor: .tint,
                        accessoryType: .disclosureIndicator
                    )
                ]
            ),
            .init(
                id: Item.uicollectionviewcell.sectonID,
                header: nil,
                footer: SPDiffableTextHeaderFooter(text: "A single data item when that item is within the collection view’s visible bounds."),
                items: [
                    ViewHeaderDiffableItem(id: Item.uicollectionviewcell.itemID, title: "UICollectionViewCell"),
                    NativeDiffableLeftButton(
                        id: Item.uicollectionviewcell.itemID + "layout_margins",
                        text: "Layout Margins",
                        textColor: .tint,
                        accessoryType: .disclosureIndicator
                    )
                ]
            ),
            .init(
                id: Item.uitextfield.sectonID,
                header: nil,
                footer: SPDiffableTextHeaderFooter(text: "An object that displays an editable text area in your interface."),
                items: [
                    ViewHeaderDiffableItem(id: Item.uitextfield.itemID, title: "UITextField"),
                    NativeDiffableLeftButton(
                        id: Item.uitextfield.itemID + "text_rect",
                        text: "Text Rect",
                        textColor: .tint,
                        accessoryType: .disclosureIndicator
                    ),
                    NativeDiffableLeftButton(
                        id: Item.uitextfield.itemID + "placeholder_rect",
                        text: "Placeholder Rect",
                        textColor: .tint,
                        accessoryType: .disclosureIndicator
                    ),
                    NativeDiffableLeftButton(
                        id: Item.uitextfield.itemID + "editing_rect",
                        text: "Editing Rect",
                        textColor: .tint,
                        accessoryType: .disclosureIndicator
                    ),
                    NativeDiffableLeftButton(
                        id: Item.uitextfield.itemID + "clear_button_rect",
                        text: "Clear Button Rect",
                        textColor: .tint,
                        accessoryType: .disclosureIndicator
                    )
                ]
            )
        ]
    }
}
