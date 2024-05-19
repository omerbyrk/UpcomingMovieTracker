

import UIKit

class HeartCheckButton: UIButton {

    // Bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                self.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
    }
        
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
        
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
            sendActions(for: .valueChanged)
        }
    }

}
