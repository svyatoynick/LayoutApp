import UIKit
import SparrowKit
import Firebase
import SPFirebase
import SPFirebaseAuth
import Constants
import Models
import Texts
import SPProfiling

public class LogicService {
    
    public static func configure() {
        
        let filePath = Bundle.module.path(forResource: Constants.Firebase.plist_filename, ofType: .empty)!
        let options = FirebaseOptions(contentsOfFile: filePath)!
        SPProfiling.configure(.onlyAuthed, firebaseOptions: options)
        
        shared.setObservers()
    }
    
    // MARK: - Private
    
    private func setObservers() {
        NotificationCenter.default.addObserver(forName: SPProfiling.didChangedAuthState, object: nil, queue: nil) { notification in
            debug("Logic/Notification: Handled notification about changed auth state.")
        }
    }
    
    // MARK: - Singltone
    
    private static let shared = LogicService()
    private init() {}
}
