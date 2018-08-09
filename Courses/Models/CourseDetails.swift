//
//  CourseDetails.swift
//  Courses
//
//  Created by Baha Ganyev on 09.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation

class CourseDetail: Decodable {
    var id: Int?
    var title: String?
    var description: String?
    var main_image_url: String?
    var logo_image_url: String?
    var contacts: [ContactResults] = []
    var branches: [BranchResults] = []
    var services: [ServiceResults] = []
    var actions: [ActionResults] = []
    var added: String?
    var updated: String?
}

class ContactResults: Decodable {
    var type: String?
    var contact: String?
}

class BranchResults: Decodable {
    var address: String?
    var latitude: String?
    var longitude: String?
}

class ServiceResults: Decodable {
    var title: String?
    var description: String?
    var price: String?
}

class ActionResults: Decodable {
    var id: Int?
    var title: String?
    var description: String?
    var end_date: String?
    var action_image: String?
}
