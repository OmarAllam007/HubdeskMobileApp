//
//  ApprovalViewController+extension.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 03/07/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import UIKit


//MARK: UITABLE VIEW
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

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
}

//MARK: UICOLLECTION VIEW
extension ApprovalViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RequesterDetailsCell", for: indexPath) as! RequesterCollectionCell
        return cell
    }
    
    
}

class RequesterCollectionCell: UICollectionViewCell {
    
}


//MARK: Display Views
extension ApprovalViewController {
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
            requestDetailsTableView.topAnchor.constraint(equalTo: requestDescriptionLabel.bottomAnchor, constant: 5),
            requestDetailsTableView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            requestDetailsTableView.widthAnchor.constraint(equalTo: view.widthAnchor , constant: -15),
            requestDetailsTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20)
            ])
        
        
    }
    
    func setupRequesterDetails(){
        mainView.addSubview(requesterDescriptionLabel)
        mainView.addSubview(requesterDetailsCollectionView)
        
        NSLayoutConstraint.activate([
            requesterDescriptionLabel.topAnchor.constraint(equalTo: requestDetailsTableView.bottomAnchor, constant: 10),
            requesterDescriptionLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            ])
        
        NSLayoutConstraint.activate([
           requesterDetailsCollectionView.topAnchor.constraint(equalTo: requesterDescriptionLabel.bottomAnchor, constant: 5),
           requesterDetailsCollectionView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
           requesterDetailsCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor , constant: -15),
           requesterDetailsCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.50)
            ])
    }
}
