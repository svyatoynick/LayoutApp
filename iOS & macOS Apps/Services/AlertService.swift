import UIKit
import AppImport
import SPAlert
import SPIndicator
import Texts

enum AlertService {
    
    // MARK: - Models
    
    enum Emotion {
        
        case positive
        case negative
    }
    
    enum Level {
        
        case attention( _ title: String)
        case note(_ title: String)
        case feel
        case invisible
    }
    
    // MARK: - Public

    static func completed(_ emotion: Emotion, _ level: Level) {
        switch level {
        case .attention(let title):
            SPAlert.present(title: title, preset: .done, haptic: .success)
            switch emotion {
            case .positive: AudioService.play(.success_positive_attention)
            case .negative: AudioService.play(.success_negative_attention)
            }
        case .note(let title):
            SPIndicator.present(title: title, preset: .done, haptic: .success)
            switch emotion {
            case .positive: AudioService.play(.success_positive_note)
            case .negative: AudioService.play(.success_negative_note)
            }
        case .feel:
            UIFeedbackGenerator.impactOccurred(.notificationSuccess)
            switch emotion {
            case .positive: AudioService.play(.success_positive_note)
            case .negative: AudioService.play(.success_negative_note)
            }
        case .invisible:
            break
        }
    }
    
    static func warning(_ emotion: Emotion, _ level: Level) {
        switch level {
        case .attention(let title):
            SPAlert.present(message: title, haptic: .warning)
            switch emotion {
            case .positive: AudioService.play(.warning_positive_attention)
            case .negative: AudioService.play(.warning_negative_attention)
            }
        case .note(let title):
            SPIndicator.present(title: title, haptic: .warning)
            switch emotion {
            case .positive: AudioService.play(.warning_positive_note)
            case .negative: AudioService.play(.warning_negative_note)
            }
        case .feel:
            UIFeedbackGenerator.impactOccurred(.notificationWarning)
            switch emotion {
            case .positive: AudioService.play(.warning_positive_note)
            case .negative: AudioService.play(.warning_negative_note)
            }
        case .invisible:
            break
        }
    }
    
    static func error(_ level: Level) {
        switch level {
        case .attention(let title):
            let view = SPAlertView.init(message: title)
            view.duration = 3
            view.present(haptic: .error, completion: nil)
            AudioService.play(.error)
        case .note(let title):
            SPIndicator.present(title: title, preset: .error, haptic: .error)
            AudioService.play(.error)
        case .feel:
            UIFeedbackGenerator.impactOccurred(.notificationError)
            AudioService.play(.error)
        default:
            break
        }
    }
    
    static func confirm(title: String, description: String, actionTitle: String, desctructive: Bool, action: @escaping ()->Void, sourceView: UIView, presentOn controller: UIViewController) {
        let alertController = UIAlertController.init(title: title, message: description, preferredStyle: .actionSheet)
        alertController.popoverPresentationController?.sourceView = sourceView
        alertController.addAction(title: actionTitle, style: desctructive ? .destructive : .default) { [] _ in
            action()
        }
        alertController.addAction(title: Texts.Shared.cancel, style: .cancel, handler: nil)
        controller.present(alertController)
    }
}
