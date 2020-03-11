import UIKit
import Bond
import ReactiveKit

class UltimateReactiveViewController: UIViewController {

    static let backgroundColor = UIColor.green

    private var saveButton: UIButton!
    private var clearButton: UIButton!
    private var textField: UITextField!
    private var textLabel: UILabel!
    private var statusLabel: UILabel!

    private var viewModel: UltimateReactiveViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UltimateReactiveViewController.backgroundColor
        self.viewModel = UltimateReactiveViewModel()

        textField = createTextField()
        saveButton = createSaveButton()
        textLabel = createTextLabel()
        clearButton = createClearButton()
        statusLabel = createStatusLabel()
        setupBindings()
    }

    private func setupBindings() {
        saveButton.reactive.controlEvents(.touchUpInside).observeNext { [unowned self] in
            self.viewModel?.save(text: self.textField.text)
        }.dispose(in: bag)

        clearButton.reactive.controlEvents(.touchUpInside).observeNext { [unowned self] in
            self.viewModel?.clear()
        }.dispose(in: bag)

        viewModel?.textSubject.observeNext { [unowned self] text in
            self.textField.text = text
            self.textLabel.text = text
        }.dispose(in: bag)

        viewModel?.modeTextSignal.observeNext {
            self.statusLabel.text = $0
        }.dispose(in: bag)

        viewModel?.hideKeyboardSignal.observeNext{
            self.textField.resignFirstResponder()
        }.dispose(in: bag)

        viewModel?.hideTextLabel.bind(to: textLabel.reactive.isHidden)
            .dispose(in: bag)
        viewModel?.hideClearButton.bind(to: clearButton.reactive.isHidden)
            .dispose(in: bag)
        viewModel?.hideTextField.bind(to: textField.reactive.isHidden)
            .dispose(in: bag)
        viewModel?.hideSaveButton.bind(to: saveButton.reactive.isHidden)
            .dispose(in: bag)
    }
}
