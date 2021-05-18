//
//  MainScreenRouter.swift
//  gitUser
//
//  Created by Andrey on 17.05.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import BytepaceSwiftUtils

final class MainScreenRouter: Router<MainScreenViewController>, MainScreenRouter.Routes {
    var openUserDetailScreenTransition: Transition = HeroTransition(animationType: .fade)
    
    typealias Routes = UserDetailScreenRoute
}

protocol MainScreenRoute {
    var openMainScreenTransition: Transition { get }
    func openMainScreen()
}
extension MainScreenRoute where Self: RouterProtocol {
    func openMainScreen() {
        let router = MainScreenRouter()
        let viewController = MainScreenFabric.assembledScreen(router)
        openWithNextRouter(viewController, nextRouter: router, transition: openMainScreenTransition)
    }
}
