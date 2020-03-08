import UIKit

class FunctionalViewController: UIViewController {

    static let backgroundColor = UIColor.lightGray

    private var saveButton: UIButton!
    private var clearButton: UIButton!
    private var textField: UITextField!
    private var label: UILabel!

    private var viewModel: FunctionalViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = FunctionalViewController.backgroundColor
        self.viewModel = FunctionalViewModel()

        textField = createTextField()
        saveButton = createSaveButton()
        label = createLabel()
        clearButton = createClearButton()
        saveButton.addTarget(self, action: #selector(self.save), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(self.clear), for: .touchUpInside)

        setupInitialView()
    }

    @objc func save(button: UIButton) {
        viewModel?.save(text: self.textField.text,
                        enterViewMode: enterViewMode)
    }

    @objc func clear(button: UIButton) {
        viewModel?.clear(enterEditMode: enterEditMode)
    }

    private func setupInitialView() {
        viewModel?.initialSetup(enterEditMode: enterEditMode,
                                enterViewMode: enterViewMode)
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
