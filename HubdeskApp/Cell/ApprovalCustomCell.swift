//
//  ApprovalCustomCell.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 03/07/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import Foundation
import UIKit

class ApprovalCustomCell: UITableViewCell {
    
    var cellTitleLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .boldSystemFont(ofSize: 18)
        v.backgroundColor = mainColor
        v.textColor = .white
        v.numberOfLines = 0
        return v
    }()
    
    var cellDescriptionLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.textColor = .black
        v.font = .systemFont(ofSize: 14)
        v.numberOfLines = 0
        return v
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cellTitleLabel)
        addSubview(cellDescriptionLabel)
        
        NSLayoutConstraint.activate([
            cellTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cellTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            cellTitleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            cellTitleLabel.heightAnchor.constraint(equalTo: heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            cellDescriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cellDescriptionLabel.leadingAnchor.constraint(equalTo: cellTitleLabel.trailingAnchor, constant: 10),
            cellDescriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            cellDescriptionLabel.heightAnchor.constraint(equalTo: heightAnchor)
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
