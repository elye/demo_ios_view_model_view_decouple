import Foundation

class DelegateViewModel {

    private unowned let delegate: DelegateView!

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
        ViewController.persistedText = text
    }

    func clear() {
        delegate.enterEditMode()
        ViewController.persistedText = String()
    }
}