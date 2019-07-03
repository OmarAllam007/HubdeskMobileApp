//
//  ApprovalViewController.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 01/07/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import UIKit

class ApprovalViewController: UIViewController {

    var approval : Approval?
    lazy var requestLabels = [" Category" ," Subcategory"," Item"," Technician"," Due date"]
        
    lazy var requestValues = [approval?.ticket.category?.name, approval?.ticket.subcategory?.name ?? "Not Assigned",
                              approval?.ticket.item?.name ?? "Not Assigned" ,approval?.ticket.technician?.name,
                              dateFromString(stringDate: (approval?.ticket.due_date ?? nil)!)]
    
    let scrollableMainView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let mainView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    lazy var approvalDescriptionView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = mainColor.cgColor
        v.layer.borderWidth = 2.0
        v.layer.masksToBounds = true
        v.layer.cornerRadius = 10
        return v
    }()
    
    lazy var ticketDescriptionView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = mainColor.cgColor
        v.layer.borderWidth = 2.0
        v.layer.masksToBounds = true
        v.layer.cornerRadius = 10
        return v
    }()
    
    lazy var approvalDescription : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14)
        v.numberOfLines = 0
        return v
    }()

    
    lazy var ticketDescription : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14)
        v.numberOfLines = 0
        return v
    }()
    
    lazy var requestDescriptionLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 18)
        v.text = "Request Details"
        return v
    }()
    
    
    lazy var requesterDescriptionLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 18)
        v.text = "Requester Details"
        return v
    }()
    
    var requestDetailsTableView : UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
   
    var requesterDetailsTableView : UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    //MARK: Loading ================================
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        requestDetailsTableView.register(ApprovalCustomCell.self, forCellReuseIdentifier: "RequestDetailsCell")
        requestDetailsTableView.delegate = self
        requestDetailsTableView.dataSource = self
        requestDetailsTableView.separatorStyle = .none
        requestDetailsTableView.adjustedContentInsetDidChange()
        
        
        setupScrollableView()
        setupViews()
        setupRequestDetails()
//        print(approval?.created_at)
    }
    
    func setupScrollableView(){
        view.addSubview(scrollableMainView)
        scrollableMainView.addSubview(mainView)
        
        
        NSLayoutConstraint.activate([
            scrollableMainView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollableMainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollableMainView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollableMainView.heightAnchor.constraint(equalTo: view.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
           mainView.topAnchor.constraint(equalTo: scrollableMainView.topAnchor),
           mainView.bottomAnchor.constraint(equalTo: scrollableMainView.bottomAnchor),
           mainView.widthAnchor.constraint(equalTo: scrollableMainView.widthAnchor),
           mainView.heightAnchor.constraint(equalTo: scrollableMainView.heightAnchor)
            ])
    }

    
    func setupViews(){
        mainView.addSubview(approvalDescriptionView)
        approvalDescriptionView.addSubview(approvalDescription)
        mainView.addSubview(ticketDescriptionView)
        ticketDescriptionView.addSubview(ticketDescription)
        
        NSLayoutConstraint.activate([
            approvalDescriptionView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
            approvalDescriptionView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            approvalDescriptionView.widthAnchor.constraint(equalTo: mainView.widthAnchor, constant: -20),
            approvalDescriptionView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.10)
            ])
        
        NSLayoutConstraint.activate([
            approvalDescription.topAnchor.constraint(equalTo: approvalDescriptionView.topAnchor, constant: 10),
            approvalDescription.leadingAnchor.constraint(equalTo: approvalDescriptionView.leadingAnchor, constant: 20),
            approvalDescription.widthAnchor.constraint(equalTo: approvalDescriptionView.widthAnchor, constant: -20),
            ])
        
        NSLayoutConstraint.activate([
           ticketDescriptionView.topAnchor.constraint(equalTo: approvalDescriptionView.bottomAnchor, constant: 10),
           ticketDescriptionView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
           ticketDescriptionView.widthAnchor.constraint(equalTo: mainView.widthAnchor, constant: -20),
           ticketDescriptionView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.10)
            ])
        
        NSLayoutConstraint.activate([
            ticketDescription.topAnchor.constraint(equalTo: ticketDescriptionView.topAnchor, constant: 10),
            ticketDescription.leadingAnchor.constraint(equalTo: ticketDescriptionView.leadingAnchor, constant: 20),
            ticketDescription.widthAnchor.constraint(equalTo: ticketDescriptionView.widthAnchor, constant: -20),
            ])
        
        approvalDescription.text = approval?.content!.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)

        ticketDescription.text = approval?.ticket.description!.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        
        
        
    }
    
    func setupRequestDetails(){
        mainView.addSubview(requestDescriptionLabel)
        
        NSLayoutConstraint.activate([
            requestDescriptionLabel.topAnchor.constraint(equalTo: ticketDescriptionView.bottomAnchor, constant: 10),
            requestDescriptionLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            ])
        
        mainView.addSubview(requestDetailsTableView)
        NSLayoutConstraint.activate([
            requestDetailsTableView.topAnchor.constraint(equalTo: requestDescriptionLabel.bottomAnchor, constant: 10),
            requestDetailsTableView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            requestDetailsTableView.widthAnchor.constraint(equalTo: view.widthAnchor , constant: -15),
            requestDetailsTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.50)
            ])
        
        
    }
}


extension ApprovalViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestDetailsCell", for: indexPath) as! ApprovalCustomCell
        cell.selectionStyle = .none
        cell.cellTitleLabel.text = requestLabels[indexPath.row]
        cell.cellDescriptionLabel.text = requestValues[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}


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
