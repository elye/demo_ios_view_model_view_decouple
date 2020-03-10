import UIKit
import ReactiveKit

class NotificationViewController: UIViewController {

    static let backgroundColor = UIColor.purple

    private var saveButton: UIButton!
    private var clearButton: UIButton!
    private var textField: UITextField!
    private var textLabel: UILabel!
    private var statusLabel: UILabel!
    
    private var viewModel: NotificationViewModel?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        NotificationCenter.default.addObserver(
            self, selector: #selector(gotNotified(_:)),
            name: NSNotification.Name(rawValue: NotificationModel.textSetNotification),
            object: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = NotificationViewController.backgroundColor
        self.viewModel = NotificationViewModel()

        textField = createTextField()
        saveButton = createSaveButton()
        textLabel = createTextLabel()
        clearButton = createClearButton()
        statusLabel = createStatusLabel()

        saveButton.addTarget(self, action: #selector(self.save), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(self.clear), for: .touchUpInside)
        setupInitialView()
    }

    deinit {
      NotificationCenter.default.removeObserver(
        self, name: NSNotification.Name(rawValue: NotificationModel.textSetNotification),
        object: self)
    }

    private func setupInitialView() {
        viewModel?.initialSetup()
    }

    @objc func save(button: UIButton) {
        viewModel?.save(text: self.textField.text)
    }

    @objc func clear(button: UIButton) {
        viewModel?.clear()
    }

    @objc private func gotNotified(_ notification: NSNotification) {
        setTextUpdate(text: notification.userInfo?[NotificationModel.textKey] as? String)
    }

    private func setTextUpdate(text: String?) {
        if let text = text, !text.isEmpty {
            enterViewMode(text: text)
        } else {
            enterEditMode()
        }
    }

    private func enterEditMode() {
        statusLabel.text = UIViewController.editMode
        textField.text = String()
        textLabel.isHidden = true
        clearButton.isHidden = true
        saveButton.isHidden = false
        textField.isHidden = false
    }

    private func enterViewMode(text: String) {
        statusLabel.text = UIViewController.viewMode
        textField.resignFirstResponder()
        textLabel.text = text
        textLabel.isHidden = false
        clearButton.isHidden = false
        saveButton.isHidden = true
        textField.isHidden = true
    }
}
