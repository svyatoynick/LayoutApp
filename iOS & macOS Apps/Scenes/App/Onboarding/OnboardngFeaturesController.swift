import UIKit
import Texts
import SparrowKit
import NativeUIKit
import SPSafeSymbols

class OnboardngFeaturesController: NativeOnboardingFeaturesController, NativeOnboardingChildInterface {
    
    weak var onboardingManagerDelegate: NativeOnboardingManagerDelegate?
    
    let actionToolbarView = NativeLargeActionToolBarView().do {
        $0.actionButton.set(
            title: "Next",
            icon: .init(.checkmark.circleFill),
            colorise: .init(content: .custom(.white), background: .tint)
        )
    }
    
    // MARK: - Init
    
    init() {
        super.init(
            iconImage: .init(SPSafeSymbol.checkmark.circleFill),
            title: Texts.App.Onboarding.Features.title,
            subtitle: Texts.App.Onboarding.Features.description
        )
        setFeatures([
            .init(
                iconImage: .init(SPSafeSymbol.checkmark.circleFill).withTintColor(.systemColorfulColors.randomElement()!, renderingMode: .alwaysOriginal),
                title: Texts.App.Onboarding.Features.random_title,
                description: Texts.App.Onboarding.Features.random_description
            ),
            .init(
                iconImage: .init(SPSafeSymbol.envelope.fill).withTintColor(.systemColorfulColors.randomElement()!, renderingMode: .alwaysOriginal),
                title: Texts.App.Onboarding.Features.random_title,
                description: Texts.App.Onboarding.Features.random_description
            ),
            .init(
                iconImage: .init(SPSafeSymbol.display).withTintColor(.systemColorfulColors.randomElement()!, renderingMode: .alwaysOriginal),
                title: Texts.App.Onboarding.Features.random_title,
                description: Texts.App.Onboarding.Features.random_description
            ),
            .init(
                iconImage: .init(SPSafeSymbol.cloud.fill).withTintColor(.systemColorfulColors.randomElement()!, renderingMode: .alwaysOriginal),
                title: Texts.App.Onboarding.Features.random_title,
                description: Texts.App.Onboarding.Features.random_description
            )
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.showsVerticalScrollIndicator = false
        if let navigationController = self.navigationController as? NativeNavigationController {
            navigationController.mimicrateToolBarView = actionToolbarView
        }
        actionToolbarView.actionButton.addAction(.init(handler: { _ in
            self.onboardingManagerDelegate?.onboardingActionComplete(for: self)
        }), for: .touchUpInside)
    }
}
