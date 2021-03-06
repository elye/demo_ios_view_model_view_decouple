import ReactiveKit

class ReactiveViewModel {

    let textSubject = ReplayOneSubject<String, Never>()

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
