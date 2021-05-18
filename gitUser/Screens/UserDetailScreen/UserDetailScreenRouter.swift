//
//  UserDetailScreenRouter.swift
//  gitUser
//
//  Created by Andrey on 17.05.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import BytepaceSwiftUtils

final class UserDetailScreenRouter: Router<UserDetailScreenViewController>, UserDetailScreenRouter.Routes {

    typealias Routes = Any
}

protocol UserDetailScreenRoute {
    var openUserDetailScreenTransition: Transition { get }
    func openUserDetailScreen(model: GitUser)
}
extension UserDetailScreenRoute where Self: RouterProtocol {
    func openUserDetailScreen(model: GitUser) {
        let router = UserDetailScreenRouter()
        let viewController = UserDetailScreenFabric.assembledScreen(router, model: model)
        openWithNextRouter(viewController, nextRouter: router, transition: openUserDetailScreenTransition)
    }
}
