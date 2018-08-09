//
//  CourseList.swift
//  Courses
//
//  Created by Baha Ganyev on 09.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation

class CourseBase: Decodable {
    var id: Int?
    var title: String?
    var description: String?
    var main_image_url: String?
    var logo_image_url: String?
    var status: String?
    var tariff: String?
}

//class SubcategoryResult: Decodable {
//    var id: Int?
//    var title: String?
//    var subcategory_image_url: String?
//}
