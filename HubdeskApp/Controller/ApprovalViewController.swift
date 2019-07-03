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
        return v
    }()
    
    lazy var approvalDescription : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14)
        return v
    }()
    
    lazy var ticketDescription : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 14)
        return v
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupScrollableView()
        setupViews()
        
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
        
        approvalDescription.text = approval?.comment

    }
}
