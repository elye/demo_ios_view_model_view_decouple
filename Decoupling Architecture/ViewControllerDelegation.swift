import UIKit

class ViewControllerDelegation: UIViewController {

    static let backgroundColor = UIColor.yellow

    private var saveButton: UIButton!
    private var clearButton: UIButton!
    private var textField: UITextField!
    private var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ViewControllerDelegation.backgroundColor

        textField = createTextField()
        saveButton = createSaveButton()
        label = createLabel()
        clearButton = createClearButton()
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
        textField.text = String()
        ViewController.persistedText = String()
        label.isHidden = true
        clearButton.isHidden = true
        saveButton.isHidden = false
        textField.isHidden = false
    }

    private func enterViewMode(text: String) {
        ViewController.persistedText = text
        label.text = text
        label.isHidden = false
        clearButton.isHidden = false
        saveButton.isHidden = true
        textField.isHidden = true
    }
}
