import UIKit

class DelegateViewController: UIViewController, DelegateView {

    static let backgroundColor = UIColor.yellow

    private var saveButton: UIButton!
    private var clearButton: UIButton!
    private var textField: UITextField!
    private var label: UILabel!

    private var viewModel: DelegateViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = DelegateViewController.backgroundColor
        self.viewModel = DelegateViewModel(delegate: self)

        textField = createTextField()
        saveButton = createSaveButton()
        label = createLabel()
        clearButton = createClearButton()
        saveButton.addTarget(self, action: #selector(self.save), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(self.clear), for: .touchUpInside)

        setupInitialView()
    }

    @objc func save(button: UIButton) {
        viewModel?.save(text: self.textField.text)
    }

    @objc func clear(button: UIButton) {
        viewModel?.clear()
    }

    private func setupInitialView() {
        viewModel?.initialSetup()
    }

    internal func enterEditMode() {
        textField.text = String()
        label.isHidden = true
        clearButton.isHidden = true
        saveButton.isHidden = false
        textField.isHidden = false
    }

    internal func enterViewMode(text: String) {
        textField.resignFirstResponder()
        label.text = text
        label.isHidden = false
        clearButton.isHidden = false
        saveButton.isHidden = true
        textField.isHidden = true
    }
}
