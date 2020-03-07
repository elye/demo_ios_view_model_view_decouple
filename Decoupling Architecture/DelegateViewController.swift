import UIKit

class DelegateViewController: UIViewController, DelegateView {

    static let backgroundColor = UIColor.yellow

    private var saveButton: UIButton!
    private var clearButton: UIButton!
    private var textField: UITextField!
    private var label: UILabel!

    private var presenter: DelegatePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = DelegateViewController.backgroundColor
        self.presenter = DelegatePresenter(delegate: self)

        textField = createTextField()
        saveButton = createSaveButton()
        label = createLabel()
        clearButton = createClearButton()
        saveButton.addTarget(self, action: #selector(self.save), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(self.clear), for: .touchUpInside)

        setupInitialView()
    }

    @objc func save(button: UIButton) {
        presenter?.save(text: self.textField.text)
    }

    @objc func clear(button: UIButton) {
        self.enterEditMode()
    }

    private func setupInitialView() {
        presenter?.initialSetup()
    }

    internal func enterEditMode() {
        textField.text = String()
        ViewController.persistedText = String()
        label.isHidden = true
        clearButton.isHidden = true
        saveButton.isHidden = false
        textField.isHidden = false
    }

    internal func enterViewMode(text: String) {
        ViewController.persistedText = text
        label.text = text
        label.isHidden = false
        clearButton.isHidden = false
        saveButton.isHidden = true
        textField.isHidden = true
    }
}
