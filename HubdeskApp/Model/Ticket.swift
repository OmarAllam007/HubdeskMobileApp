//
//  Ticket.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 25/06/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import Foundation

struct Ticket : Codable{
    let id:Int
    let requester_id:Int
    let creator_id:Int
    let coordinator_id:Int?
    let technician_id:Int?
    let group_id:Int?
    let subject:String?
    let description:String?
    let category_id:Int?
    let subcategory_id:Int?
    let item_id:Int?
    let status_id:Int?
    let priority_id:Int?
    let impact_id:Int?
    let urgency_id:Int?
    let sla_id:Int?
    let due_date:String?
    let first_response_date:String?
    let resolve_date:String?
    let close_date:String?
    let business_unit_id:Int?
    let location_id:Int?
    let time_spent:Int?
    let deleted_at:String?
    let created_at:String?
    let updated_at:String?
    let overdue:Int?
    let sdp_id:Int?
    let type:Int?
    let request_id:Int?
    let requester:User?
    let technician:User?
    let status: Status?
    let approvals:[Approval]?
    let replies:[Reply]?
    let attachments:[Attachment]?
    let log:[TicketLog]?
}

struct TicketLog:Codable {
    
}

struct Attachment: Codable {
    
}
struct Reply : Codable{
    
}

struct Status : Codable{
    let id:Int?
    let name:String?
    let description:String?
    let type:Int?
    let deleted_at:String?
    let created_at:String?
    let updated_at:String?
}
