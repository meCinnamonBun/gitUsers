//
//  UserDetailScreenFabric.swift
//  gitUser
//
//  Created by Andrey on 17.05.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

final class UserDetailScreenFabric {
    class func assembledScreen(_ router: UserDetailScreenRouter = .init(), model: GitUser) -> UserDetailScreenViewController {
        let interactor = UserDetailScreenInteractor()
        let presenter = UserDetailScreenPresenter(router, interactor)
        let viewController = UserDetailScreenViewController(presenter, model: model)
        router.viewController = viewController
        return viewController
    }
}
