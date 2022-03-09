import SPDiffable

class ViewHeaderDiffableItem: SPDiffableItem {
    
    let title: String
    
    init(id: String, title: String) {
        self.title = title
        super.init(id: id)
    }
}
