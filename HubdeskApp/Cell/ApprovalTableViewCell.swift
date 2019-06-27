//
//  ApprovalTableViewCell.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 26/06/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import UIKit

class ApprovalTableViewCell: UITableViewCell {

    
    var approval: Approval!
    
    let approvalID: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let approvalSubject: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14)
        //        v.numberOfLines = 0
        return v
    }()
    
    let approvalTechnician: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14)
        return v
    }()
    
    let approvalCreatedAt: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14)
        return v
    }()
    
    let approvalStatus: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14)
        return v
    }()
    
    let approvalDueAt: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14)
        return v
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    func setupCellView(){
        addSubview(approvalID)
        addSubview(approvalSubject)
        addSubview(approvalTechnician)
        addSubview(approvalCreatedAt)
        addSubview(approvalStatus)
        addSubview(approvalDueAt)
        
        NSLayoutConstraint.activate([
            approvalID.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            approvalID.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            approvalSubject.topAnchor.constraint(equalTo: approvalID.bottomAnchor, constant: 10),
            approvalSubject.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            approvalSubject.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
            ])
        
        NSLayoutConstraint.activate([
            approvalTechnician.topAnchor.constraint(equalTo: approvalSubject.bottomAnchor, constant: 10),
            approvalTechnician.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            approvalCreatedAt.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            //            ticketCreatedAt.leadingAnchor.constraint(equalTo: ticketTechnician.trailingAnchor),
            approvalCreatedAt.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ])
        
        NSLayoutConstraint.activate([
            approvalStatus.topAnchor.constraint(equalTo: approvalCreatedAt.bottomAnchor, constant: 10),
            //            ticketStatus.leadingAnchor.constraint(equalTo: ticketSubject.trailingAnchor),
            approvalStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ])
        
        NSLayoutConstraint.activate([
            approvalDueAt.topAnchor.constraint(equalTo: approvalStatus.bottomAnchor, constant: 10),
            //            ticketDueAt.leadingAnchor.constraint(equalTo: ticketTechnician.trailingAnchor),
            approvalDueAt.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ])
    }
}
