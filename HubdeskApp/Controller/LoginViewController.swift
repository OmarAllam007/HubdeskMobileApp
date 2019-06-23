//
//  LoginViewController.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 11/06/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let backgroundView:UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    let loginContainer:UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 5
        v.layer.masksToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let loginButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = mainColor
        btn.tintColor = .white
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let customerIdTextField : UITextField = {
        let v = UITextField()
        v.placeholder = "Employee ID"
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let lineSeparator: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(red:0.10, green:0.31, blue:0.49, alpha:1.0)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let passwordTextField : UITextField = {
        let v = UITextField()
        v.placeholder = "Password"
        v.isSecureTextEntry = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let mainViewLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "Login"
        v.textColor = UIColor.black
        v.textAlignment = .center
        v.font = UIFont.boldSystemFont(ofSize: 20)
        v.font = UIFont.systemFont(ofSize: 30)
        return v
    }()
    

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackGroundView()
        setupLoginContainer()
        setupLoginButton()
        setupInputs()
        setupMainLabelView()
        
    }
    
    
    
    func setupBackGroundView(){
        
        self.view.addSubview(backgroundView)
        
        //MARK:- background-constraints
        backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    }
    
    
    func setupLoginContainer(){
        
        self.view.addSubview(loginContainer)
        
        //MARK:- login-constraints
        loginContainer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginContainer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        loginContainer.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -30).isActive = true
        loginContainer.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    func setupLoginButton(){
        
        
        self.view.addSubview(loginButton)
        
        //MARK:- login-btn-constraints
        loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: loginContainer.bottomAnchor,constant: 15).isActive = true
        loginButton.widthAnchor.constraint(equalTo: loginContainer.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
//        loginButton.addTarget(self, action: #selector(loginToApp), for: .touchUpInside)
    }
    
    func setupInputs(){
        
        loginContainer.addSubview(customerIdTextField)
        loginContainer.addSubview(lineSeparator)
        loginButton.addSubview(passwordTextField)
        //x, y , width, height
        
        customerIdTextField.leftAnchor.constraint(equalTo: loginContainer.leftAnchor, constant:10).isActive = true
        customerIdTextField.topAnchor.constraint(equalTo: loginContainer.topAnchor).isActive = true
        customerIdTextField.widthAnchor.constraint(equalTo: loginContainer.widthAnchor).isActive = true
        customerIdTextField.heightAnchor.constraint(equalTo: loginContainer.heightAnchor, multiplier: 1/2).isActive = true
        
        
        lineSeparator.leftAnchor.constraint(equalTo: loginContainer.leftAnchor).isActive = true
        lineSeparator.topAnchor.constraint(equalTo: customerIdTextField.bottomAnchor).isActive = true
        lineSeparator.widthAnchor.constraint(equalTo: loginContainer.widthAnchor).isActive = true
        lineSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: loginContainer.leftAnchor, constant:10).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: lineSeparator.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: loginContainer.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: loginContainer.heightAnchor, multiplier: 1/2).isActive = true
    }
    
    func setupMainLabelView()  {
        
        view.addSubview(mainViewLabel)
        mainViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainViewLabel.bottomAnchor.constraint(equalTo: loginContainer.topAnchor, constant: -30).isActive = true
        mainViewLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        mainViewLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

}
