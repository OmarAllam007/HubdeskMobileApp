//
//  TicketsViewController.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 11/06/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import UIKit
import Alamofire

class TicketsViewController: UIViewController {

    var tickets : [Ticket] = []
    
    let ticketsTableView : UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let createTicketButton: UIButton = {
        let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.setTitle("+", for: .normal)
        v.backgroundColor = .lightGray
        v.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        v.titleLabel?.font = .systemFont(ofSize: 24)
        v.layer.cornerRadius = 30
        v.layer.masksToBounds = true
        return v
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ticketsTableView.register(TicketTableViewCell.self, forCellReuseIdentifier: "TicketCell")
        ticketsTableView.delegate = self
        ticketsTableView.dataSource = self
        
        navigationItem.title = "Tickets"
        view.backgroundColor = .white
        
        getOpenTickets()
        
        setupTicketsTableView()
        setupCreateButton()
        
    }
    
    func getOpenTickets(){
        if let _token = UserDefaults.standard.string(forKey: "_token") {

            Alamofire.request(url(path:"user/user_tickets"), method: .get ,parameters: nil , headers:["Authorization":"Bearer " + _token]).responseJSON { (response) in
//            dump(String(data:response.data!, encoding: String.Encoding.utf8))
                do{
                    let tickets = try JSONDecoder().decode([Ticket].self, from: response.data!)
                    self.tickets = tickets

                    self.ticketsTableView.reloadData()
                }
                catch(let error){
                        print(error)
                }
                
            }
        }
       
    }
    
    
    func setupTicketsTableView(){
        view.addSubview(ticketsTableView)
        
        NSLayoutConstraint.activate([
            ticketsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ticketsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ticketsTableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            ])
    }
    
    func setupCreateButton(){
        view.addSubview(createTicketButton)
        
        NSLayoutConstraint.activate([
            createTicketButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            createTicketButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            createTicketButton.widthAnchor.constraint(equalToConstant: 60),
            createTicketButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

}

extension TicketsViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath) as! TicketTableViewCell
        let ticket = tickets[indexPath.row]
        cell.ticket = ticket
        cell.ticketID.text = "#\(ticket.id)"
        cell.ticketSubject.text = ticket.subject
        cell.ticketTechnician.text = ticket.technician?.name
        cell.ticketCreatedAt.text = ticket.created_at
        cell.ticketStatus.text = ticket.status?.name
        cell.ticketDueAt.text = ticket.due_date ?? "Not assigned"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}
