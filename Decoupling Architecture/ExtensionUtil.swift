import UIKit

extension UIViewController {
    func createSaveButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Save", for: UIControl.State())
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.setupView(parentView: self.view, yPos: 200, color: .red)
        return button
    }

    func createTextField() -> UITextField {
        let textField = UITextField()
        view.addSubview(textField)
        textField.textAlignment = .center
        textField.setupView(parentView: self.view, yPos: 100, color: .white)
        return textField
    }

    func createLabel() -> UILabel {
        let textLabel = UILabel()
        textLabel.textAlignment = .center
        textLabel.setupView(parentView: self.view, yPos: 100, color: .gray)
        return textLabel
    }

    func createClearButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Clear", for: UIControl.State())
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.setupView(parentView: self.view, yPos: 200, color: .blue)
        return button
    }
}

extension UIView {
    func setupView(parentView: UIView, yPos: Int, color: UIColor) {
        parentView.addSubview(self)
        self.backgroundColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            self.topAnchor.constraint(equalTo: parentView.topAnchor, constant: CGFloat(yPos)),
            self.heightAnchor.constraint(equalToConstant: 60),
            self.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
}
