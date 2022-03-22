import UIKit
import SparrowKit
import SPProfiling
import Models
import Texts

enum Controllers {
    
    enum App {
        
        enum Settings {
            
            static var home: UIViewController { SettingsController() }
        }
    }
    
    enum Views {
        
        static var home: UIViewController { ViewsHomeController() }
    }
}
