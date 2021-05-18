//
//  UserDetailScreenView.swift
//  gitUser
//
//  Created by Andrey on 17.05.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import PinLayout

final class UserDetailScreenView: UIView {
    private let disposeBag = DisposeBag()
    
    var model: GitUser? {
        didSet {
            guard let model = model else { return }
            
            userImageView.heroID = model.imageURL
            userImageView.kf.setImage(with: URL(string: model.imageURL!))
            nameLabel.heroID = "\(model.id)"
            nameLabel.text = model.name
        }
    }
    
    // MARK: - UI Elements
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = .spacing4
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Lifecycle
    
    init() {
        super.init(frame: .zero)
        
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

extension UserDetailScreenView {
    
    private func setupSubviews() {
        addSubviews(nameLabel, userImageView)
        
        backgroundColor = .white
    }
    
    private func configureSubviews() {
        userImageView.pin
            .vCenter(-.spacing)
            .height(50%)
            .horizontally(.spacing)
        
        nameLabel.pin
            .below(of: userImageView)
            .marginTop(.smallSpacing)
            .hCenter()
            .sizeToFit()
    }
}

private extension CGFloat {
    static let spacing: CGFloat = 40
    static let smallSpacing: CGFloat = 10
    static let spacing4: CGFloat = 4
}
