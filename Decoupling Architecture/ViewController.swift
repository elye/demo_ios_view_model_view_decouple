import UIKit

class ViewController: UIViewController {

    static var persistedText: String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton(title: "Basic Architecture", color: ViewControllerBasicArch.backgroundColor, yPos: 100).addTarget(self, action: #selector(self.pressedBasic), for: .touchUpInside)

        createButton(title: "Delegate Architecture", color:  ViewControllerDelegation.backgroundColor, yPos: 200).addTarget(self, action: #selector(self.pressedDelegate), for: .touchUpInside)
    }

    @objc func pressedBasic(sender: UIButton!) {
        let viewController = ViewControllerBasicArch()
        self.present(viewController, animated: true)
    }

    @objc func pressedDelegate(sender: UIButton!) {
        let viewController = ViewControllerDelegation()
        self.present(viewController, animated: true)
    }

    private func createButton(title: String, color: UIColor, yPos: Int) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: UIControl.State())
        button.setTitleColor(UIColor.red, for: UIControl.State())
        view.addSubview(button)
        button.backgroundColor = color
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(yPos)),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.widthAnchor.constraint(equalToConstant: 300),
        ])

        return button
    }
}
