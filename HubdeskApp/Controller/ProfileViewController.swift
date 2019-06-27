//
//  ProfileViewController.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 22/06/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {

    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        
        getUserInfo()
    }
    
    func getUserInfo(){
        if let _token = UserDefaults.standard.string(forKey: "_token") {
            Alamofire.request(url(path:"user/user_profile"), method: .get ,parameters: nil , headers:["Authorization":"Bearer " + _token]).responseJSON { (response) in
                do{
                    let user = try JSONDecoder().decode(User.self, from: response.data!)
                    self.user = user
                }
                catch(let error){
                    print(error)
                }
                
            }
        }
    }

}
