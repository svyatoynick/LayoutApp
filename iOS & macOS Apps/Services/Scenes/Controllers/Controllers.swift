import UIKit
import SparrowKit
import SPProfiling
import Models
import Texts

enum Controllers {
    
    enum App {
        
        enum Onboarding {
           
            static var container: UIViewController { OnbooardingController() }
            static var features: UIViewController { OnboardngFeaturesController() }
            static var auth: UIViewController {
                AuthOnboardingController(
                    title: "Title",
                    description: "Description"
                )
            }
        }
        
        enum Settings {
            
            static var home: UIViewController { SettingsController() }
        }
    }
    
    enum Views {
        
        static var home: UIViewController { ViewsHomeController() }
    }
}
