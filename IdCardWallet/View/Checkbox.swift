import UIKit

class Checkbox: UIButton {
    // Images for the checked and unchecked states
    private let checkedImage = UIImage(named: "tabProfile")
    private let uncheckedImage = UIImage(named: "tabPeople")

    // Property to store the current checkbox state
    var isChecked = false {
        didSet {
            updateImage()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        print("checked")
        addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
        updateImage()
    }

    private func updateImage() {
        let image = isChecked ? checkedImage : uncheckedImage
        setImage(image, for: .normal)
    }

    @objc private func checkboxTapped() {
        print("checked")
        isChecked.toggle()
    }
}
