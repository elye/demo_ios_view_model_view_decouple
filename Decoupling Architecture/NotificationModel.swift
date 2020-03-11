import Foundation

class NotificationModel {
    static let textSetNotification = "textSetNotification"
    static let textKey = "text"
    static var sharedInstance = NotificationModel()
    private init() {
        text = ViewController.persistedText
    }
    var text: String? {
        didSet {
            ViewController.persistedText = text ?? String()
            let data:[String: String?] = [NotificationModel.textKey: text]

            NotificationCenter.default.post(
                name: NSNotification.Name(rawValue: NotificationModel.textSetNotification),
                object: nil, userInfo: data as [AnyHashable : Any])
        }
    }
}
