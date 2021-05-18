//
//  Hero + Transition.swift
//  gitUser
//
//  Created by Andrey on 17.05.2021.
//

import UIKit
import Hero
import BytepaceSwiftUtils

class HeroTransition: NSObject {
    
    var isAnimated: Bool = true
    var completionHandler: (() -> Void)?
    var animationType: HeroDefaultAnimationType

    weak var viewController: UIViewController?

    init(isAnimated: Bool = true, animationType: HeroDefaultAnimationType = .fade) {
        self.isAnimated = isAnimated
        self.animationType = animationType
    }
}

// MARK: - Transition

extension HeroTransition: Transition {

    func open(_ viewController: UIViewController) {
        viewController.hero.isEnabled = true
        self.viewController?.navigationController?.hero.isEnabled = true
        self.viewController?.navigationController?.hero.navigationAnimationType = animationType
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }

    func close(_ viewController: UIViewController) {
        self.viewController?.navigationController?.hero.isEnabled = true
        viewController.navigationController?.popViewController(animated: isAnimated)
    }
}
