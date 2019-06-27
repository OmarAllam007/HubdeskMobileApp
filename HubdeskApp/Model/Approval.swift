//
//  Approval.swift
//  HubdeskApp
//
//  Created by No Name on 27/06/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import Foundation

class Approval:Codable {
    static let statuses = [1:"Approved",0:"Pending Approval",-1:"Denied",-2:"Escalated"]
    let id:Int
    let creator_id:Int
    let approver_id:Int
    let ticket_id:Int
    let content:String?
    let status:Int
    let comment:String?
    let approval_date:String?
    let deleted_at:String?
    let created_at:String?
    let updated_at:String?
    let stage:Int
    let ticket:Ticket
    let approver:User
    let created_by:User
}

enum ApprovalStatus{
    
}
