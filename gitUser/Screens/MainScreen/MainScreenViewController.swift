//
//  MainScreenViewController.swift
//  gitUser
//
//  Created by Andrey on 17.05.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift

final class MainScreenViewController: UIViewController {
    private let _view: MainScreenView
    private var presenter: MainScreenPresenter
    private let disposeBag = DisposeBag()
    
    init(_ presenter: MainScreenPresenter) {
        _view = MainScreenView()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        title = "Contributors"
        
        self._view.refreshControl.beginRefreshing()
        self._view.refreshControl.sendActions(for: .valueChanged)
    }
}


// MARK: - UI Bindings

extension MainScreenViewController {
    private func setupBindings() {
        let refresh = _view.refreshControl.rx.controlEvent(.valueChanged)
            .map { _ in () }
        
        let input = MainScreenPresenter.Input(cellTap: _view.cellTap.asObservable(),
                                              refresh: refresh)
        let output = presenter.buildOutput(with: input)
        
        output.users
            .bind { [unowned self] users in
                self._view.gitUsers = users
            }
            .disposed(by: disposeBag)
    }
}
