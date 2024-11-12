//
//  TagCell.swift
//  MobileCode23001
//
//  Created by Nilar Win on 12/11/2024.
//

import Foundation
import UIKit

class TagCell: UICollectionViewCell {
    
    let tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 7
        contentView.layer.borderColor = UIColor.darkGray.cgColor
        contentView.layer.borderWidth = 1
        contentView.clipsToBounds = true
        contentView.addSubview(tagLabel)
        
        NSLayoutConstraint.activate([
            tagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tagLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            tagLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            tagLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        tagLabel.text = text
    }
    
    func changeWhiteTextColor(){
        tagLabel.textColor = .white
    }
}
