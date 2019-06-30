//
//  ProfileViewController+Extension.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 29/06/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import Foundation
import UIKit
extension ProfileViewController {
    
    
    func setupProfileViews(){
        
        view.addSubview(informationView)
        informationView.addArrangedSubview(employeeIDView)
        informationView.addArrangedSubview(emailView)
        informationView.addArrangedSubview(positionView)
        informationView.addArrangedSubview(companyView)
        informationView.addArrangedSubview(departmentView)
        informationView.addArrangedSubview(signoutButton)
        
        NSLayoutConstraint.activate([
            informationView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            informationView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            informationView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.80),
            informationView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.95),
            ])
        
        NSLayoutConstraint.activate([
            employeeIDView.centerXAnchor.constraint(equalTo: informationView.centerXAnchor),
            employeeIDView.widthAnchor.constraint(equalTo: informationView.widthAnchor),
            ])
        
        NSLayoutConstraint.activate([
            emailView.centerXAnchor.constraint(equalTo: informationView.centerXAnchor),
            emailView.widthAnchor.constraint(equalTo: informationView.widthAnchor),
            ])
        
        NSLayoutConstraint.activate([
            positionView.centerXAnchor.constraint(equalTo: informationView.centerXAnchor),
            positionView.widthAnchor.constraint(equalTo: informationView.widthAnchor),
            ])
        
        NSLayoutConstraint.activate([
            positionView.centerXAnchor.constraint(equalTo: informationView.centerXAnchor),
            positionView.widthAnchor.constraint(equalTo: informationView.widthAnchor),
            ])
        
        NSLayoutConstraint.activate([
            companyView.centerXAnchor.constraint(equalTo: informationView.centerXAnchor),
            companyView.widthAnchor.constraint(equalTo: informationView.widthAnchor),
            ])
        
        NSLayoutConstraint.activate([
            departmentView.centerXAnchor.constraint(equalTo: informationView.centerXAnchor),
            departmentView.widthAnchor.constraint(equalTo: informationView.widthAnchor),
            ])
        
        NSLayoutConstraint.activate([
            signoutButton.centerXAnchor.constraint(equalTo: informationView.centerXAnchor),
            signoutButton.widthAnchor.constraint(equalTo: informationView.widthAnchor,multiplier: 0.90),
            ])
    }
    
    
    func setupLabels(){
        employeeIDView.addSubview(employeeIdLabel)
        emailView.addSubview(emailLabel)
        positionView.addSubview(positionLabel)
        companyView.addSubview(companyLabel)
        departmentView.addSubview(departmentLabel)
        
        NSLayoutConstraint.activate([
            employeeIdLabel.centerYAnchor.constraint(equalTo: employeeIDView.centerYAnchor),
            employeeIdLabel.leadingAnchor.constraint(equalTo: employeeIDView.leadingAnchor, constant: 10),
            ])
        
        NSLayoutConstraint.activate([
            emailLabel.centerYAnchor.constraint(equalTo: emailView.centerYAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 10),
            ])
        
        NSLayoutConstraint.activate([
            positionLabel.centerYAnchor.constraint(equalTo: positionView.centerYAnchor),
            positionLabel.leadingAnchor.constraint(equalTo: positionView.leadingAnchor, constant: 10),
            ])
        
        NSLayoutConstraint.activate([
            companyLabel.centerYAnchor.constraint(equalTo: companyView.centerYAnchor),
            companyLabel.leadingAnchor.constraint(equalTo: companyView.leadingAnchor, constant: 10),
            ])
        
        NSLayoutConstraint.activate([
            departmentLabel.centerYAnchor.constraint(equalTo: departmentView.centerYAnchor),
            departmentLabel.leadingAnchor.constraint(equalTo: departmentView.leadingAnchor, constant: 10),
            ])
        
        signoutButton.addTarget(self, action: #selector(signout), for: .touchUpInside)
    }
}
