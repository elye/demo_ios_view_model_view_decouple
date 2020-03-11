import Foundation

class NotificationViewModel {

    func initialSetup() {
        NotificationModel.sharedInstance.text = NotificationModel.sharedInstance.text
    }

    func save(text: String?) {
        guard let text = text, !text.isEmpty else {
            return
        }
        NotificationModel.sharedInstance.text = text
    }

    func clear() {
        NotificationModel.sharedInstance.text = nil
    }
}
