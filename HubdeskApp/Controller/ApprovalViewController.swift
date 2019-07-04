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
    
    var replies:[Reply]?
    
    lazy var requestLabels = [" Category" ," Subcategory"," Item"," Technician"," Due date"]
        
    lazy var requestValues = [approval?.ticket.category?.name, approval?.ticket.subcategory?.name ?? "Not Assigned",
                              approval?.ticket.item?.name ?? "Not Assigned" ,approval?.ticket.technician?.name,
                              dateFromString(stringDate: (approval?.ticket.due_date ?? nil))]
    lazy var requesterLabels = [" Name" ," Employee ID"," Email"," Company"," Position"]
    
    lazy var requesterValues = [approval?.ticket.requester?.name,
                                approval?.ticket.requester?.employee_id,
                                approval?.ticket.requester?.email,
                                approval?.ticket.requester?.business_unit?.name,
                                approval?.ticket.requester?.job
                                ]
    
    //MARK: Loading ================================
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        print(approval?.ticket.replies)

        setupScrollableView()
        setupViews()
        setupRequestDetails()
        setupRequesterDetails()
        
        getTicketReplies()
    }
    
    
   
    
    
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
    
    
    lazy var requesterDetailsCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //        layout.estimatedItemSize = CGSize(width: view.frame.width , height: 100)
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.delegate = self
        v.dataSource = self
        v.backgroundColor  = .clear
        return v
    }()
    
}

