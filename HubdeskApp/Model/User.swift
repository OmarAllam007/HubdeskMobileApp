//
//  User.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 25/06/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import Foundation

struct User : Codable{
    
    let id: Int?
    let name: String?
    let email: String?
    let login: String?
    let password: String?
    let location_id: Int?
    let business_unit_id: Int?
    let branch_id: Int?
    let department_id: Int?
    let manager_id: Int?
    let vip: Int?
    let phone: String?
    let mobile1: String?
    let mobile2: Int?
    let is_ad: Int?
    let remember_token: String?
    let deleted_at: String?
    let created_at: String?
    let updated_at: String?
    let job: String?
    let employee_id: String?
    let extra_fields: ExtraFields?
}

struct ExtraFields : Codable{
    let emis_id:String?
    let ar_name:String?
    let nationality:String?
    let id_number:String?
    let religion:String?
    let passport_number:String?
    let gender:String?
    let martital_status:String?
    let no_of_children:String?
    let hire_date:String?
    let personal_area:String?
    let personal_sub_area:String?
    let cr_file_no:String?
}
