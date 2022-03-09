import UIKit
import Texts
import SPDiffable
import SparrowKit
import NativeUIKit
import SPProfiling
import SPSafeSymbols
import SPSettingsIcons

class SettingsController: SPDiffableTableController {
    
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
        navigationItem.title = Texts.App.Settings.title
        tableView.register(ProfileTableViewCell.self)
        configureDiffable(sections: content, cellProviders: SPDiffableTableDataSource.CellProvider.default + [.profile])
    }
    
    // MARK: - Diffable
    
    internal enum Section: String {
        
        case profile
        case notifications
        case appearance
        case language
        case social
        
        var id: String { rawValue }
    }
    
    internal enum Item: String {
        
        case profile
        case notifications
        case appearance_style
        case appearance_tint
        case language
        case social_website
        
        var id: String { rawValue }
    }
    
    internal var content: [SPDiffableSection] {
        [
            .init(
                id: Section.profile.id,
                header: nil,
                footer: SPDiffableTextHeaderFooter(text: "Description here too."),
                items: [
                    DiffableProfileItem(
                        authTitle: "Sign In",
                        authDescription: "For sync your data between all devieces",
                        cellAuthSubtitle: "Sync between devices",
                        cellProfileSubtitle: "You are welcome",
                        features: [],
                        presentOn: self
                    )
                ]
            ),
            .init(
                id: Section.notifications.id,
                header: SPDiffableTextHeaderFooter(text: "Notifications"),
                footer: SPDiffableTextHeaderFooter(text: "Description here"),
                items: [
                    SPDiffableTableRow(
                        id: Item.notifications.id,
                        text: "Notifications",
                        detail: nil,
                        icon: .generateSettingsIcon(
                            SPSafeSymbol.bell.fill.name,
                            backgroundColor: .systemRed
                        ),
                        accessoryType: .disclosureIndicator,
                        selectionStyle: .default,
                        action: nil
                    )
                ]
            ),
            .init(
                id: Section.appearance.id,
                header: SPDiffableTextHeaderFooter(text: "Appearance"),
                footer: SPDiffableTextHeaderFooter(text: "Description here"),
                items: [
                    SPDiffableTableRow(
                        id: Item.appearance_style.id,
                        text: "Style",
                        detail: nil,
                        icon: .generateSettingsIcon(
                            SPSafeSymbol.lightbulb.fill.name,
                            backgroundColor: .systemYellow
                        ),
                        accessoryType: .disclosureIndicator,
                        selectionStyle: .default,
                        action: nil
                    ),
                    SPDiffableTableRow(
                        id: Item.appearance_tint.id,
                        text: "Tint",
                        detail: nil,
                        icon: .generateSettingsIcon(
                            SPSafeSymbol.eyedropper.halffull.name,
                            backgroundColor: .systemIndigo
                        ),
                        accessoryType: .disclosureIndicator,
                        selectionStyle: .default,
                        action: nil
                    )
                ]
            ),
            .init(
                id: Section.language.id,
                header: nil,
                footer: SPDiffableTextHeaderFooter(text: "Description here"),
                items: [
                    SPDiffableTableRow(
                        id: Item.language.id,
                        text: "Language",
                        detail: "Russian",
                        icon: .generateSettingsIcon(
                            SPSafeSymbol.globe.name,
                            backgroundColor: .systemGray
                        ),
                        accessoryType: .disclosureIndicator,
                        selectionStyle: .default,
                        action: nil
                    )
                ]
            )
        ]
    }
}


