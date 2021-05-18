//
//  MainScreenView.swift
//  gitUser
//
//  Created by Andrey on 17.05.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import BytepaceSwiftUtils

final class MainScreenView: UIView {
    private let disposeBag = DisposeBag()
    
    let cellTap = PublishRelay<GitUser>()
    
    var gitUsers: [GitUser] = [] {
        didSet {
            refreshControl.endRefreshing()
            tableView.reloadData()
        }
    }
    
    lazy var refreshControl: UIRefreshControl = .init()
    
    // MARK: - UI Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorInset = .zero
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    init() {
        super.init(frame: .zero)
        
        tableView.refreshControl = refreshControl
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: GitUserCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        configureSubviews()
    }
}

// MARK: - Private Methods

extension MainScreenView {
    
    private func setupSubviews() {
        addSubviews(tableView)
    }
    
    private func configureSubviews() {
        backgroundColor = .white
        
        tableView.pin
            .all(pin.safeArea)
    }
}

extension MainScreenView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gitUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withCellType: GitUserCell.self)
        cell.model = gitUsers[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? GitUserCell else {
            return
        }
        guard let model = cell.model else { return }
        
        cellTap.accept(model)
    }
}
