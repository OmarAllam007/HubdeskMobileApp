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
    var filteredApprovals: [Approval] = []
    
    let approvalsTableView : UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    lazy var approvalsStatusFilters : UISegmentedControl = {
        
        let v = UISegmentedControl(items: ["Waiting for Approval","Approved","Rejected"])
        v.translatesAutoresizingMaskIntoConstraints = false
        v.setWidth(self.view.frame.width / 2.5 , forSegmentAt: 0)
        v.selectedSegmentIndex = 0
        v.tintColor = secondaryColor
        v.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        v.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        return v
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Approvals"
        approvalsTableView.register(ApprovalTableViewCell.self, forCellReuseIdentifier: "ِApprovalCell")
        approvalsTableView.delegate = self
        approvalsTableView.dataSource = self
        
        loadUserApprovals()
        setupApprovalFilter()
        setupApprovalsTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        loadUserApprovals()
    }
    
    func setupApprovalFilter(){
        view.addSubview(approvalsStatusFilters)
        
        NSLayoutConstraint.activate([
            approvalsStatusFilters.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            approvalsStatusFilters.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            approvalsStatusFilters.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            ])
        
        approvalsStatusFilters.addTarget(self, action: #selector(filterChanged), for: .valueChanged)
    }
    
    
    @objc func filterChanged(){
        changeStatusFilter()
    }
    
    
    func changeStatusFilter(){
        let index = approvalsStatusFilters.selectedSegmentIndex
        if index == 0 {
            self.filteredApprovals = self.approvals.filter({ (Approval) -> Bool in
                return Approval.status == 0
            })
        }
        else if index == 1 {
            self.filteredApprovals = self.approvals.filter({ (Approval) -> Bool in
                return Approval.status == 1
            })
        }
        else if index == 2 {
            self.filteredApprovals = self.approvals.filter({ (Approval) -> Bool in
                return Approval.status == -1
            })
        }
        self.approvalsTableView.reloadData()
    }
    func setupApprovalsTableView(){
        view.addSubview(approvalsTableView)
        
        NSLayoutConstraint.activate([
            approvalsTableView.topAnchor.constraint(equalTo: approvalsStatusFilters.bottomAnchor, constant: 20),
            approvalsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            approvalsTableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            ])
    }
    
    func loadUserApprovals(){
        if let _token = UserDefaults.standard.string(forKey: "_token") {
            Alamofire.request(url(path:"user/user_approvals"), method: .get ,parameters: nil , headers:["Authorization":"Bearer " + _token]).responseJSON { (response) in
                do{
                    let approvals = try JSONDecoder().decode([Approval].self, from: response.data!)
                    
                    self.approvals = approvals
                    self.filteredApprovals = approvals
                    self.changeStatusFilter()
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
        return filteredApprovals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ِApprovalCell", for: indexPath) as! ApprovalTableViewCell
        let approval = filteredApprovals[indexPath.row]
        
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
