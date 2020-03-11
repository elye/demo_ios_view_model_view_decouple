import ReactiveKit

class UltimateReactiveViewModel {

    let textSubject = ReplayOneSubject<String, Never>()
    private var isTextSetSignal: Signal<Bool, Never> { textSubject.map { !$0.isEmpty } }
    var hideTextField: Signal<Bool, Never> { isTextSetSignal }
    var hideSaveButton: Signal<Bool, Never> { isTextSetSignal }
    var hideTextLabel: Signal<Bool, Never> { isTextSetSignal.map { !$0 } }
    var hideClearButton: Signal<Bool, Never> { isTextSetSignal.map { !$0 } }
    var hideKeyboardSignal: Signal<Void, Never> { isTextSetSignal.filter{ $0 }.map{ _ in } }
    var modeTextSignal: Signal<String, Never> { isTextSetSignal.map {
        self.editModeText(isTextSet: $0) }
    }

    init() {
        textSubject.send(ViewController.persistedText)
    }

    func save(text: String?) {
        guard let text = text, !text.isEmpty else {
            return
        }
        ViewController.persistedText = text
        textSubject.send(text)
    }

    func clear() {
        ViewController.persistedText = String()
        textSubject.send(String())
    }

    private func editModeText(isTextSet: Bool) -> String {
        if (isTextSet) {
            return ViewController.viewMode
        } else {
            return ViewController.editMode
        }
    }
}
