import UIKit
import SparrowKit
import NativeUIKit

class ViewHeaderTableCell: SPTableViewCell {
    
    let titleLabel = SPLabel().do {
        $0.font = .preferredFont(forTextStyle: .title1, weight: .bold)
        $0.textColor = .label
    }
    
    override func commonInit() {
        super.commonInit()
        higlightStyle = .none
        contentView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.layoutDynamicHeight(width: contentView.layoutWidth)
        titleLabel.frame.origin.x = contentView.layoutMargins.left
        titleLabel.setMaxYToSuperviewBottomMargin()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return .init(width: size.width, height: 140)
    }
}
