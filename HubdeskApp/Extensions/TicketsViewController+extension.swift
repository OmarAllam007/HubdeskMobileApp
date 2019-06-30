//
//  TicketsViewController+extension.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 29/06/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import Foundation
import UIKit

extension TicketsViewController {

    func setupTicketsTableView(){
        
        ticketsTableView.register(TicketTableViewCell.self, forCellReuseIdentifier: "TicketCell")
        ticketsTableView.delegate = self
        ticketsTableView.dataSource = self
        
        view.addSubview(ticketsTableView)
        
        NSLayoutConstraint.activate([
            ticketsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ticketsTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
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
    
    func setupSearchBarView(){
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Ticket ID"
        searchBar.sizeToFit()
        searchBar.isTranslucent = true
        searchBar.delegate = self
        searchBar.barTintColor = .white
        
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
//            textfield.textColor = UIColor.blue
            textfield.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
            textfield.keyboardType = .numberPad
        }
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.90),
            ])
        
        view.addSubview(advancedFiltersButton)
        
        NSLayoutConstraint.activate([
            advancedFiltersButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            advancedFiltersButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            advancedFiltersButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            advancedFiltersButton.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 5),
            advancedFiltersButton.heightAnchor.constraint(equalToConstant: searchBar.frame.height)
            ])
        

        
    }
}



extension TicketsViewController : UITableViewDataSource , UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredtickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath) as! TicketTableViewCell
        cell.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        
        let ticket = filteredtickets[indexPath.row]
        cell.ticket = ticket
        cell.ticketID.text = "#\(ticket.id)"
        cell.ticketSubject.text = ticket.subject
        cell.ticketTechnician.text = ticket.technician?.name
        cell.ticketCreatedAt.text = dateFromString(stringDate:ticket.created_at!)
        cell.ticketStatus.text = ticket.status?.name
        cell.ticketDueAt.text = (ticket.due_date != nil) ? dateFromString(stringDate: ticket.due_date!) : "Not Assigned"
        
        cell.layer.borderWidth = CGFloat(2)
        cell.layer.borderColor = ticketsTableView.backgroundColor?.cgColor
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
   
    
}

extension TicketsViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text != ""  {
            filteredtickets = filteredtickets.filter { (Ticket) -> Bool in
                return String(Ticket.id) == searchText
            }
            
        }else{
         filteredtickets = tickets
        }
        
        self.ticketsTableView.reloadData()
        filteredtickets = tickets
        
    }
}
