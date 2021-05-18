//
//  MainScreenPresenter.swift
//  gitUser
//
//  Created by Andrey on 17.05.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import RxCocoa
import RxSwift
import BytepaceSwiftUtils

protocol MainScreenPresenterProtocol: RxPresenter {
    var router: Router<MainScreenViewController> { get }
    func buildOutput(with input: MainScreenPresenter.Input) -> MainScreenPresenter.Output
}

final class MainScreenPresenter {
    
    var router: Router<MainScreenViewController>
    private let interactor: MainScreenInteractor
    
    private let disposeBag = DisposeBag()

    init(_ router: Router<MainScreenViewController>, _ interactor: MainScreenInteractor) {
        self.router = router
        self.interactor = interactor
    }
}

extension MainScreenPresenter: MainScreenPresenterProtocol {
    struct Input {
        var cellTap: Observable<GitUser>
        var refresh: Observable<Void>
    }

    struct Output {
        var users: Observable<[GitUser]>
    }

    func bindInput(_ input: MainScreenPresenter.Input) {
        input.cellTap
            .bind { [unowned self] user in
                guard let route = router as? UserDetailScreenRoute else {
                    return
                }
                route.openUserDetailScreen(model: user)
            }
            .disposed(by: disposeBag)
        
        input.refresh
            .bind { [unowned self] in
                self.interactor.getUsers()
            }
            .disposed(by: disposeBag)
    }

    func configureOutput(_ input: MainScreenPresenter.Input) -> MainScreenPresenter.Output {

        return Output(users: interactor.usersRelay.asObservable())
    }
}
