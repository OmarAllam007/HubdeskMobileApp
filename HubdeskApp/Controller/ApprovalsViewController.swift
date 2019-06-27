//
//  CreateTicketViewController.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 11/06/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import UIKit
import Alamofire

class ApprovalsViewController: UIViewController {

    
    var approvals : [Approval] = []
    
    let approvalsTableView : UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Approvals"
        approvalsTableView.register(ApprovalTableViewCell.self, forCellReuseIdentifier: "ِApprovalCell")
        approvalsTableView.delegate = self
        approvalsTableView.dataSource = self
        
        loadUserApprovals()
        
        setupApprovalsTableView()
    }

    func setupApprovalsTableView(){
        view.addSubview(approvalsTableView)
        NSLayoutConstraint.activate([
            approvalsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            approvalsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            approvalsTableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            ])
    }
    
    func loadUserApprovals(){
        if let _token = UserDefaults.standard.string(forKey: "_token") {
            Alamofire.request(url(path:"user/user_approvals"), method: .get ,parameters: nil , headers:["Authorization":"Bearer " + _token]).responseJSON { (response) in
                do{
                    let approvals = try JSONDecoder().decode([Approval].self, from: response.data!)
                    
                    self.approvals = approvals
            
                    self.approvalsTableView.reloadData()
                }
                catch(let error){
                    print(error)
                }
                
            }
        }
    }


}

extension ApprovalsViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return approvals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ِApprovalCell", for: indexPath) as! ApprovalTableViewCell
        let approval = approvals[indexPath.row]
        
        cell.approval = approval
        cell.approvalID.text = "#\(approval.id)"
        cell.approvalSubject.text = approval.ticket.subject
        cell.approvalTechnician.text = approval.ticket.technician!.name
        cell.approvalCreatedAt.text = approval.created_at
        cell.approvalStatus.text = Approval.statuses[approval.status]
//        cell.approvalDueAt.text = ticket.due_date ?? "Not assigned"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}
