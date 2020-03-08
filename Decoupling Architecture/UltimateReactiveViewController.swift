import UIKit
import Bond
import ReactiveKit

class UltimateReactiveViewController: UIViewController {

    static let backgroundColor = UIColor.green

    private var saveButton: UIButton!
    private var clearButton: UIButton!
    private var textField: UITextField!
    private var label: UILabel!

    private var viewModel: UltimateReactiveViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UltimateReactiveViewController.backgroundColor
        self.viewModel = UltimateReactiveViewModel()

        textField = createTextField()
        saveButton = createSaveButton()
        label = createLabel()
        clearButton = createClearButton()
        setupBindings()
    }

    private func setupBindings() {
        saveButton.reactive.controlEvents(.touchUpInside).observeNext { [unowned self] in
            self.viewModel?.save(text: self.textField.text)
        }
        .dispose(in: bag)

        clearButton.reactive.controlEvents(.touchUpInside).observeNext { [unowned self] in
            self.viewModel?.clear()
        }
        .dispose(in: bag)

        viewModel?.textSubject.observeNext { [unowned self] text in
            self.textField.text = text
            self.label.text = text
        }
        .dispose(in: bag)

        viewModel?.isTextSetSignal.map({ !$0 }).bind(to: label.reactive.isHidden)
        viewModel?.isTextSetSignal.map({ !$0 }).bind(to: clearButton.reactive.isHidden)
        viewModel?.isTextSetSignal.bind(to: textField.reactive.isHidden)
        viewModel?.isTextSetSignal.bind(to: saveButton.reactive.isHidden)
    }
}
