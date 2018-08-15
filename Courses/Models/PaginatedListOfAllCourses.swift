//
//  PaginatedListOfAllCourses.swift
//  Courses
//
//  Created by Baha Ganyev on 14.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation

class Result: Decodable {
    var results: [ResultList] = []
}

class ResultList: Decodable {
    var id: Int?
    var title: String?
    var description: String?
    var main_image_url: String?
    var logo_image_url: String?
}
