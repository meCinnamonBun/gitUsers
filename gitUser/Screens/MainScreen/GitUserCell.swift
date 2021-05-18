//
//  GitUserCell.swift
//  gitUser
//
//  Created by Andrey on 17.05.2021.
//

import Kingfisher
import UIKit
import BytepaceSwiftUtils
import Hero

class GitUserCell: UITableViewCell, ClassIdentifiable {
    var model: GitUser? {
        didSet {
            updateUI()
            guard let model = model else { return }
            userImageView.heroID = model.imageURL
            nameLabel.heroID = "\(model.id)"
        }
    }
    
    // UI
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = .imageViewLength / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var IDLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()
    
    // Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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

extension GitUserCell {
    private func updateUI() {
        guard let model = model else { return }
        
        nameLabel.text = model.name
        IDLabel.text = "\(model.id)"
        
        guard let string = model.imageURL else { return }
        guard let url = URL(string: string) else { return }
        userImageView.kf.setImage(with: url)
    }
    
    private func setupSubviews() {
        self.backgroundColor = .clear
        contentView.backgroundColor = .none
        selectionStyle = .none
        contentView.addSubviews(userImageView,
                                nameLabel, IDLabel)
    }
    
    private func configureSubviews() {
        userImageView.pin
            .vertically(.smallSpacing)
            .left(.spacing)
            .width(.imageViewLength)
            .height(.imageViewLength)
        
        nameLabel.pin
            .top(to: userImageView.edge.top)
            .marginTop(.smallSpacing)
            .after(of: userImageView)
//            .right()
            .marginHorizontal(.spacing / 2)
//            .sizeToFit(.width)
            .sizeToFit()
        
        IDLabel.pin
            .bottom(to: userImageView.edge.bottom)
            .marginBottom(.smallSpacing)
            .after(of: userImageView)
            .right()
            .marginHorizontal(.spacing / 2)
            .sizeToFit(.width)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.pin
            .width(size.width)
            .height(CGFloat.greatestFiniteMagnitude)
        configureSubviews()
        let h = userImageView.frame.maxY + .smallSpacing
        return CGSize(width: size.width, height: h)
    }
}

private extension CGFloat {
    static let imageViewLength: CGFloat = 70
    static let spacing: CGFloat = 20
    static let smallSpacing: CGFloat = 10
}
