import UIKit
import Constants
import SparrowKit
import NativeUIKit

class OnbooardingController: NativeOnboardingController {
    
    init() {
        super.init(controllers: [
            Controllers.App.Onboarding.features,
            Controllers.App.Onboarding.auth
        ], completion: {
            Flags.seen_tutorial = true
        })
        
        allowScroll = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
