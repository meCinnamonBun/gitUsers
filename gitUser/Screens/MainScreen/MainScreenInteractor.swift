//
//  MainScreenInteractor.swift
//  gitUser
//
//  Created by Andrey on 17.05.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import RxSwift
import RxCocoa

final class MainScreenInteractor {
    private let disposeBag = DisposeBag()
    private let api = GitUsersAPI.shared
    
    let usersRelay = PublishRelay<[GitUser]>()
    
    func getUsers() {
        api.getUsers()
            .catchErrorJustReturn([])
            .bind(to: usersRelay)
            .disposed(by: disposeBag)
    }
}
