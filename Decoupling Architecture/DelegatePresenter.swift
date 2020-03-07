import Foundation

class DelegatePresenter {

    private weak var delegate: DelegateView!

    init(delegate: DelegateView) {
        self.delegate = delegate
    }

    func initialSetup() {
        if (ViewController.persistedText.isEmpty) {
            delegate.enterEditMode()
        } else {
            delegate.enterViewMode(text: ViewController.persistedText)
        }
    }

    func save(text: String?) {
        guard let text = text, !text.isEmpty else {
            return
        }
        delegate.enterViewMode(text: text)
    }
}
