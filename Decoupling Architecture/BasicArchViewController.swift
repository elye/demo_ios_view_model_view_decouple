import UIKit

class BasicArchViewController: UIViewController {

    static let backgroundColor = UIColor.cyan

    private var saveButton: UIButton!
    private var clearButton: UIButton!
    private var textField: UITextField!
    private var textLabel: UILabel!
    private var statusLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = BasicArchViewController.backgroundColor

        textField = createTextField()
        saveButton = createSaveButton()
        textLabel = createTextLabel()
        clearButton = createClearButton()
        statusLabel = createStatusLabel()
        
        saveButton.addTarget(self, action: #selector(self.save), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(self.clear), for: .touchUpInside)

        setupInitialView()
    }

    @objc func save(button: UIButton) {
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        self.enterViewMode(text: text)
    }

    @objc func clear(button: UIButton) {
        self.enterEditMode()
    }

    private func setupInitialView() {
        if (ViewController.persistedText.isEmpty) {
            self.enterEditMode()
        } else {
            self.enterViewMode(text: ViewController.persistedText)
        }
    }

    private func enterEditMode() {
        ViewController.persistedText = String()
        statusLabel.text = UIViewController.editMode
        textField.resignFirstResponder()
        textField.text = String()
        textLabel.isHidden = true
        clearButton.isHidden = true
        saveButton.isHidden = false
        textField.isHidden = false
    }

    private func enterViewMode(text: String) {
        ViewController.persistedText = text
        statusLabel.text = UIViewController.viewMode
        textLabel.text = text
        textLabel.isHidden = false
        clearButton.isHidden = false
        saveButton.isHidden = true
        textField.isHidden = true
    }
}
