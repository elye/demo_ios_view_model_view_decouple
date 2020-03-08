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
        ViewController.persistedText = text
        textSubject.send(text)
    }

    func clear() {
        ViewController.persistedText = String()
        textSubject.send(String())
    }
}
