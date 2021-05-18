//
//  UserDetailScreenViewController.swift
//  gitUser
//
//  Created by Andrey on 17.05.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class UserDetailScreenViewController: UIViewController {
    private let _view: UserDetailScreenView
    private var presenter: UserDetailScreenPresenter
    
    init(_ presenter: UserDetailScreenPresenter, model: GitUser) {
        _view = UserDetailScreenView()
        _view.model = model
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        setupBindings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = _view
    }
}


// MARK: - UI Bindings

extension UserDetailScreenViewController {
    private func setupBindings() {
        let input = UserDetailScreenPresenter.Input()
        let output = presenter.buildOutput(with: input)
    }
}
