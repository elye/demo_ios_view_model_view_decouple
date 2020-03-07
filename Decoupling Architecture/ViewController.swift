import UIKit

class ViewController: UIViewController {

    static var persistedText: String = String()

    private static let basicColor = UIColor.cyan

    override func viewDidLoad() {
        super.viewDidLoad()
        createButton(title: "Basic Architecture", color: ViewController.basicColor, yPos: 100).addTarget(self, action: #selector(self.pressed), for: .touchUpInside)
    }

    @objc func pressed(sender: UIButton!) {
        let basicViewController = ViewControllerBasicArch()
        self.present(basicViewController, animated: true)
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
