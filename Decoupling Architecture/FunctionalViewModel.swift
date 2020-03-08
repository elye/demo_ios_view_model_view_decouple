import Foundation

class FunctionalViewModel {

    func initialSetup(enterEditMode: () -> Void,
                      enterViewMode: (_ text: String) -> Void) {
        if (ViewController.persistedText.isEmpty) {
            enterEditMode()
        } else {
            enterViewMode(ViewController.persistedText)
        }
    }

    func save(text: String?,
              enterViewMode: (_ text: String) -> Void) {
        guard let text = text, !text.isEmpty else {
            return
        }
        ViewController.persistedText = text
        enterViewMode(text)
    }

    func clear(enterEditMode: () -> Void) {
        ViewController.persistedText = String()
        enterEditMode()
    }
}
