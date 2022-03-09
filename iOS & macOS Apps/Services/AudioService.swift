import UIKit
import AVFoundation

class AudioService {
    
    // MARK: - Public
    
    public static func play(_ audio: Audio) {
        let fileName = audio.fileName
        shared.playSound(fileName: fileName)
    }
    
    public enum Audio: String {
        
        case success_positive_attention
        case success_negative_attention
        case success_positive_note
        case success_negative_note
        
        case warning_positive_attention
        case warning_negative_attention
        case warning_positive_note
        case warning_negative_note
        
        case notifications_positive
        case notifications_negative
        
        case error
        
        var fileName: String {
            switch self {
            case .success_positive_attention: return "Success4.wav"
            case .success_negative_attention: return "Complete4.wav"
            case .success_positive_note: return "Success7.wav"
            case .success_negative_note: return "Complete7.wav"
            case .warning_positive_attention: return "Success9.wav"
            case .warning_negative_attention: return "Alert6.wav"
            case .warning_positive_note: return "Alert2.wav"
            case .warning_negative_note: return "Alert8.wav"
            case .error: return "Error1.wav"
            case .notifications_positive: return "Notification22.wav"
            case .notifications_negative: return "Notification5.wav"
            }
        }
    }
    
    // MARK: - Private
    
    private func playSound(fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: .empty) else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Singltone
    
    private var player: AVAudioPlayer?
    private static var shared = AudioService()
    private init() {}
}
