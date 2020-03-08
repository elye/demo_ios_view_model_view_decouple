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
        textSubject.send(text)
        ViewController.persistedText = text
    }

    func clear() {
        textSubject.send(String())
        ViewController.persistedText = String()
    }
}
