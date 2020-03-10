import UIKit
import ReactiveKit

class ReactiveViewController: UIViewController {

    static let backgroundColor = UIColor.orange

    private var saveButton: UIButton!
    private var clearButton: UIButton!
    private var textField: UITextField!
    private var textLabel: UILabel!
    private var statusLabel: UILabel!

    private var viewModel: ReactiveViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ReactiveViewController.backgroundColor
        self.viewModel = ReactiveViewModel()

        textField = createTextField()
        saveButton = createSaveButton()
        textLabel = createTextLabel()
        clearButton = createClearButton()
        statusLabel = createStatusLabel()
        
        saveButton.addTarget(self, action: #selector(self.save), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(self.clear), for: .touchUpInside)

        setupBindings()
    }

    @objc func save(button: UIButton) {
        viewModel?.save(text: self.textField.text)
    }

    @objc func clear(button: UIButton) {
        viewModel?.clear()
    }

    private func setupBindings() {
        viewModel?.textSubject.observeNext { [unowned self] text in
            if text.isEmpty {
                self.enterEditMode()
            } else {
                self.enterViewMode(text: text)
            }
        }.dispose(in: bag)
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
