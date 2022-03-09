import Foundation
import Texts

extension Texts {
    
    enum App {
        
        enum Settings {
            
            static var title: String { NSLocalizedString("app settings title", comment: "") }
        }
        
        enum Bar {
            
            static var side_title: String { Shared.application_name }
        }
        
        enum Onboarding {
            
            enum Features {
                
                static var title: String { NSLocalizedString("app onboarding title", comment: "") }
                static var description: String { NSLocalizedString("app onboarding description", comment: "") }
                
                static var random_title: String {
                    ["First Feature", "Second Feature", "Third Feature", "Unreal Feature"].randomElement()!
                }
                
                static var random_description: String {
                    [
                        "Browse the latest documentation, including API reference, articles, and sample code.",
                        "Learn about the latest advances and features in Xcode through presentations by Apple engineers.",
                        "Ask questions and discuss development topics with Apple engineers and other developers.",
                        "Get step-by-step guidance on how to use Xcode to build, test, and submit apps to the App Store."
                    ].randomElement()!
                }
            }
        }
    }
}
