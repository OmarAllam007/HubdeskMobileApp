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
                              dateFromString(stringDate: (approval?.ticket.due_date ?? nil))]
    
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
    
   
    var requesterDetailsCollectionView:UICollectionView = {
        let v = UICollectionView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    //MARK: Loading ================================
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        requestDetailsTableView.register(ApprovalCustomCell.self, forCellReuseIdentifier: "RequestDetailsCell")
        
        requesterDetailsTableView.register(RequesterCollectionCell.self, forCellReuseIdentifier: "RequesterDetailsCell")
        
        requestDetailsTableView.delegate = self
        requestDetailsTableView.dataSource = self
        requestDetailsTableView.separatorStyle = .none
        
        
        
        requesterDetailsCollectionView.dataSource = self
        requesterDetailsCollectionView.delegate = self
        
        
        
        setupScrollableView()
        setupViews()
        setupRequestDetails()
        setupRequesterDetails()
//        print(approval?.created_at)
    }
    
    
   
}

