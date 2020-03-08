import Foundation

class NotificationModel {
    static let textSetNotification = "textSetNotification"
    static var sharedInstance = NotificationModel()
    private init() { }
    var text: String? {
        didSet {
            ViewController.persistedText = text ?? String()
            NotificationCenter.default.post(
                name: NSNotification.Name(rawValue: NotificationModel.textSetNotification),
                object: nil)
        }
    }
}
