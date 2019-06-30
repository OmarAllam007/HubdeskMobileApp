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
    
    let employeeIDView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 10
        v.backgroundColor = profileBackgroundColor
        v.layer.masksToBounds = true
        return v
    }()
    
    let emailView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 10
        v.backgroundColor = profileBackgroundColor
        v.layer.masksToBounds = true
        return v
    }()
    
    let positionView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 10
        v.backgroundColor = profileBackgroundColor
        v.layer.masksToBounds = true
        return v
    }()
    
    let companyView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 10
        v.backgroundColor = profileBackgroundColor
        v.layer.masksToBounds = true
        return v
    }()
    
    let departmentView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 10
        v.backgroundColor = profileBackgroundColor
        v.layer.masksToBounds = true
        return v
    }()
    
    
    let informationView : UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.alignment = .center
        v.axis = .vertical
        v.distribution = .fillEqually
        v.spacing = 10
        return v
    }()
    
    
    let signoutButton : UIButton = {
        let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = signoutButtonColor
        v.setTitle("Signout", for: .normal)
        v.tintColor = .white
        v.titleLabel?.font = .systemFont(ofSize: 20)
        v.layer.masksToBounds = false
        v.layer.cornerRadius = 20
        v.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        v.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        v.layer.shadowOpacity = 1.0
        v.layer.shadowRadius = 0.0
        return v
        
    }()
    
    
    let employeeIdLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = profileBackgroundColor
        v.textColor = mainColor
        v.font = .systemFont(ofSize: 16)
        v.font = .boldSystemFont(ofSize: 16)
        return v
    }()
    
    
    let emailLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = profileBackgroundColor
        v.textColor = mainColor
        v.font = .systemFont(ofSize: 16)
        v.font = .boldSystemFont(ofSize: 16)
        return v
    }()
    
    let positionLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = profileBackgroundColor
        v.textColor = mainColor
        v.font = .systemFont(ofSize: 16)
        v.font = .boldSystemFont(ofSize: 16)
        return v
    }()
    
    let companyLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = profileBackgroundColor
        v.textColor = mainColor
        v.font = .systemFont(ofSize: 16)
        v.font = .boldSystemFont(ofSize: 16)
        return v
    }()
    
    let departmentLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = profileBackgroundColor
        v.textColor = mainColor
        v.font = .systemFont(ofSize: 16)
        v.font = .boldSystemFont(ofSize: 16)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ""
        
        getUserInfo()
        
        setupProfileViews()
        setupLabels()
        
    }
    
   
    @objc func signout(){
        if let _token = UserDefaults.standard.string(forKey: "_token") {
            Alamofire.request(url(path:"user/user_logout"), method: .post ,parameters: nil , headers:["Authorization":"Bearer " + _token]).responseJSON { (response) in
              
                    if response.response?.statusCode == 200 {
                        UserDefaults.standard.removeObject(forKey: "_token")
                        
                        self.dismiss(animated: true, completion: nil)
                        self.present(LoginViewController(), animated: true)
                    }
            }
        }
    }
 
    func getUserInfo(){
        if let _token = UserDefaults.standard.string(forKey: "_token") {
            Alamofire.request(url(path:"user/user_profile"), method: .get ,parameters: nil , headers:["Authorization":"Bearer " + _token]).responseJSON { (response) in
                do{
                    self.user =  try JSONDecoder().decode(User.self, from: response.data!)
                    
                    if self.user != nil {
                        self.employeeIdLabel.text = "\(self.user!.employee_id ?? "Not Assigned" )"
                        self.emailLabel.text = "\(self.user!.email ?? "Not Assigned" )"
                        self.positionLabel.text = "\(self.user!.job ?? "Not Assigned" )"
                        self.companyLabel.text = "\(self.user!.business_unit?.name ?? "Not Assigned" )"
                        self.departmentLabel.text = "\(self.user!.department?.name ?? "Not Assigned" )"
                        self.navigationItem.title = "\(self.user!.name ?? "Not Assigned" )"
                    }
                
                }
                catch(let error){
                    print(error)
                }
                
            }
        }
    }

}
