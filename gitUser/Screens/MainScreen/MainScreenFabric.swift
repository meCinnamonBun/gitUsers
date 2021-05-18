//
//  MainScreenFabric.swift
//  gitUser
//
//  Created by Andrey on 17.05.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

final class MainScreenFabric {
    class func assembledScreen(_ router: MainScreenRouter = .init()) -> MainScreenViewController {
        let interactor = MainScreenInteractor()
        let presenter = MainScreenPresenter(router, interactor)
        let viewController = MainScreenViewController(presenter)
        router.viewController = viewController
        return viewController
    }
}
