import UIKit
import SPDiffable

extension SPDiffableTableDataSource.CellProvider {
    
    public static var viewHeader: SPDiffableTableDataSource.CellProvider  {
        return SPDiffableTableDataSource.CellProvider() { (tableView, indexPath, item) -> UITableViewCell? in
            guard let item = item as? ViewHeaderDiffableItem else { return nil }
            let cell = tableView.dequeueReusableCell(withClass: ViewHeaderTableCell.self, for: indexPath)
            cell.titleLabel.text = item.title
            return cell
        }
    }
}
