//
//  ApprovalReplyTableViewCell.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 05/07/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import UIKit

class ApprovalReplyTableViewCell: UITableViewCell {
    
    var replyCreatedByLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .boldSystemFont(ofSize: 18)
//        v.backgroundColor = mainColor
        v.textColor = .black
        v.numberOfLines = 0
        return v
    }()
    
    var replyCreatedAtLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.textColor = .black
        v.font = .systemFont(ofSize: 14)
        v.numberOfLines = 0
        return v
    }()
    
    var replyContentLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.textColor = .black
        v.font = .systemFont(ofSize: 14)
        v.numberOfLines = 0
        return v
    }()
    
    var replyStatusLabel : CustomLabel = {
        let v = CustomLabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.textColor = .black
        v.font = .systemFont(ofSize: 14)
        v.numberOfLines = 0
        v.textAlignment = .center
        v.layer.masksToBounds = true
        v.layer.cornerRadius = 5
        return v
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(replyCreatedByLabel)
        addSubview(replyCreatedAtLabel)
        addSubview(replyContentLabel)
        addSubview(replyStatusLabel)
        
        NSLayoutConstraint.activate([
            replyCreatedByLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            replyCreatedByLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ])
        
        NSLayoutConstraint.activate([
            replyCreatedAtLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            replyCreatedAtLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            ])
        
        
        NSLayoutConstraint.activate([
            replyContentLabel.topAnchor.constraint(equalTo: replyCreatedByLabel.bottomAnchor, constant: 10),
            replyContentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            replyContentLabel.widthAnchor.constraint(equalTo: widthAnchor),
            
            ])
        
        NSLayoutConstraint.activate([
           replyStatusLabel.topAnchor.constraint(equalTo: replyContentLabel.bottomAnchor, constant: 10),
           replyStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
