//
//  Workers.swift
//  UserD_Dame
//
//  Created by Dameion Dismuke on 12/29/22.
//

import Foundation


// Worker
struct Workers: Decodable {
    let status: String
    let data: [WorkerData]
}

// WorkerData
struct WorkerData: Decodable {
    let id, workerName, workerSalary, workerAge: String
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case workerName = "employee_name"
        case workerSalary = "employee_salary"
        case workerAge = "employee_age"
        case profileImage = "profile_image"
    }
}
