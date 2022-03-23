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
    
    enum Frames {
        
        static var home: UIViewController { FramesHomeController() }
    }
    
    enum AutoLayout {
        
        static var home: UIViewController { AutoLayoutHomeController() }
    }
    
    enum Controllers {
        
        static var home: UIViewController { ControllersHomeController() }
    }
}
