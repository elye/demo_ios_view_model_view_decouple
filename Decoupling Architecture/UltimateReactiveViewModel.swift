import ReactiveKit

class UltimateReactiveViewModel {

    let textSubject = ReplayOneSubject<String, Never>()
    var isTextSetSignal: Signal<Bool, Never> {
        textSubject.map { !$0.isEmpty }
    }

    init() {
        textSubject.send(ViewController.persistedText)
    }

    func save(text: String?) {
        guard let text = text, !text.isEmpty else {
            return
        }
        textSubject.send(text)
        ViewController.persistedText = text
    }

    func clear() {
        textSubject.send(String())
        ViewController.persistedText = String()
    }
}
