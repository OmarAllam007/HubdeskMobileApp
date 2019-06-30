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
    var filteredtickets : [Ticket] = []

    
    let searchBar : UISearchBar = {
        let v = UISearchBar()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let ticketsTableView : UITableView = {
        let v = UITableView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let createTicketButton: UIButton = {
        let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.setTitle("+", for: .normal)
        v.backgroundColor = UIColor(red: 0.46, green: 0.74, blue: 0.26, alpha: 1.0)
        v.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        v.layer.cornerRadius = 30
        v.layer.masksToBounds = false
        v.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50).cgColor
        v.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        v.layer.shadowOpacity = 1.0
        v.layer.shadowRadius = 0.0
        return v
    }()
    
    let advancedFiltersButton:UIButton = {
        let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.imageView?.contentMode = .scaleAspectFit
        v.setImage(UIImage(named: "filterIcon"), for: .normal)
        return v
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Tickets"
        view.backgroundColor = .white
    
        getOpenTickets()
        setupSearchBarView()
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
                    self.filteredtickets = tickets
                    self.ticketsTableView.reloadData()
                }
                catch(let error){
                        print(error)
                }
                
            }
        }
       
    }
    
}
