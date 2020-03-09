import UIKit
import ReactiveKit

class NotificationViewController: UIViewController {

    static let backgroundColor = UIColor.purple

    private var saveButton: UIButton!
    private var clearButton: UIButton!
    private var textField: UITextField!
    private var label: UILabel!

    private var viewModel: NotificationViewModel?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        NotificationCenter.default.addObserver(
            self, selector: #selector(getTextUpdate),
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
        label = createLabel()
        clearButton = createClearButton()
        saveButton.addTarget(self, action: #selector(self.save), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(self.clear), for: .touchUpInside)
        getTextUpdate()
    }

    deinit {
      NotificationCenter.default.removeObserver(
        self, name: NSNotification.Name(rawValue: NotificationModel.textSetNotification),
        object: self)
    }

    @objc func save(button: UIButton) {
        viewModel?.save(text: self.textField.text)
    }

    @objc func clear(button: UIButton) {
        viewModel?.clear()
    }

    @objc private func getTextUpdate() {
        if let text = NotificationModel.sharedInstance.text, !text.isEmpty {
            enterViewMode(text: text)
        } else {
            enterEditMode()
        }
    }

    private func enterEditMode() {
        textField.text = String()
        label.isHidden = true
        clearButton.isHidden = true
        saveButton.isHidden = false
        textField.isHidden = false
    }

    private func enterViewMode(text: String) {
        textField.resignFirstResponder()
        label.text = text
        label.isHidden = false
        clearButton.isHidden = false
        saveButton.isHidden = true
        textField.isHidden = true
    }
}
