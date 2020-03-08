import UIKit

class ViewController: UIViewController {

    static var persistedText: String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton(title: "No Architecture", color: BasicArchViewController.backgroundColor, yPos: 100).addTarget(self, action: #selector(self.pressedBasic), for: .touchUpInside)

        createButton(title: "Delegate Architecture", color:  DelegateViewController.backgroundColor, yPos: 200).addTarget(self, action: #selector(self.pressedDelegate), for: .touchUpInside)

        createButton(title: "Functional Architecture", color:  FunctionalViewController.backgroundColor, yPos:300).addTarget(self, action: #selector(self.pressedFunctional), for: .touchUpInside)

        createButton(title: "Notification Architecture", color:  NotificationViewController.backgroundColor, yPos:400).addTarget(self, action: #selector(self.pressedNotification), for: .touchUpInside)

        createButton(title: "Reactive Architecture", color:  ReactiveViewController.backgroundColor, yPos:500).addTarget(self, action: #selector(self.pressedReactive), for: .touchUpInside)

        createButton(title: "Full Reactive Architecture", color:  UltimateReactiveViewController.backgroundColor, yPos:600).addTarget(self, action: #selector(self.pressedUltimateReactive), for: .touchUpInside)
    }

    @objc func pressedBasic(sender: UIButton!) {
        let viewController = BasicArchViewController()
        self.present(viewController, animated: true)
    }

    @objc func pressedDelegate(sender: UIButton!) {
        let viewController = DelegateViewController()
        self.present(viewController, animated: true)
    }

    @objc func pressedFunctional(sender: UIButton!) {
        let viewController = FunctionalViewController()
        self.present(viewController, animated: true)
    }

    @objc func pressedNotification(sender: UIButton!) {
        let viewController = NotificationViewController()
        self.present(viewController, animated: true)
    }

    @objc func pressedReactive(sender: UIButton!) {
        let viewController = ReactiveViewController()
        self.present(viewController, animated: true)
    }

    @objc func pressedUltimateReactive(sender: UIButton!) {
        let viewController = UltimateReactiveViewController()
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
