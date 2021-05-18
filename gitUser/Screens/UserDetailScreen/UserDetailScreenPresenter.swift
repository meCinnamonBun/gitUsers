//
//  UserDetailScreenPresenter.swift
//  gitUser
//
//  Created by Andrey on 17.05.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import RxCocoa
import RxSwift
import BytepaceSwiftUtils

protocol UserDetailScreenPresenterProtocol: RxPresenter {
    var router: Router<UserDetailScreenViewController> { get }
    func buildOutput(with input: UserDetailScreenPresenter.Input) -> UserDetailScreenPresenter.Output
}

final class UserDetailScreenPresenter {
    
    var router: Router<UserDetailScreenViewController>
    private let interactor: UserDetailScreenInteractor
    
    private let disposeBag = DisposeBag()

    init(_ router: Router<UserDetailScreenViewController>, _ interactor: UserDetailScreenInteractor) {
        self.router = router
        self.interactor = interactor
    }
}

extension UserDetailScreenPresenter: UserDetailScreenPresenterProtocol {
    struct Input {}

    struct Output {}

    func bindInput(_ input: UserDetailScreenPresenter.Input) {

    }

    func configureOutput(_ input: UserDetailScreenPresenter.Input) -> UserDetailScreenPresenter.Output {

        return Output()
    }
}
