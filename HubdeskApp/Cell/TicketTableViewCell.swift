//
//  TicketTableViewCell.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 25/06/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import UIKit

class TicketTableViewCell: UITableViewCell {

    var ticket: Ticket!
    
    let ticketID: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let ticketSubject: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14)
//        v.numberOfLines = 0
        return v
    }()
    
    let ticketTechnician: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14)
        return v
    }()
    
    let ticketCreatedAt: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14)
        return v
    }()
    
    let ticketStatus: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14)
        return v
    }()
    
    let ticketDueAt: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14)
        return v
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .lightGray
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellView()
    }
    
    
    func setupCellView(){
        addSubview(ticketID)
        addSubview(ticketSubject)
        addSubview(ticketTechnician)
        addSubview(ticketCreatedAt)
        addSubview(ticketStatus)
        addSubview(ticketDueAt)
        
        NSLayoutConstraint.activate([
            ticketID.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            ticketID.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            ticketSubject.topAnchor.constraint(equalTo: ticketID.bottomAnchor, constant: 10),
            ticketSubject.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ticketSubject.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
            ])
        
        NSLayoutConstraint.activate([
            ticketTechnician.topAnchor.constraint(equalTo: ticketSubject.bottomAnchor, constant: 10),
            ticketTechnician.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            ticketCreatedAt.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            ticketCreatedAt.leadingAnchor.constraint(equalTo: ticketTechnician.trailingAnchor),
            ticketCreatedAt.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ])
        
        NSLayoutConstraint.activate([
            ticketStatus.topAnchor.constraint(equalTo: ticketCreatedAt.bottomAnchor, constant: 10),
//            ticketStatus.leadingAnchor.constraint(equalTo: ticketSubject.trailingAnchor),
            ticketStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ])
        
        NSLayoutConstraint.activate([
            ticketDueAt.topAnchor.constraint(equalTo: ticketStatus.bottomAnchor, constant: 10),
//            ticketDueAt.leadingAnchor.constraint(equalTo: ticketTechnician.trailingAnchor),
            ticketDueAt.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ])
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }


        
    
}

class cell: TicketTableViewCell {
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 4
            frame.size.height -= 2 * 5
            super.frame = frame
        }
    }
}
