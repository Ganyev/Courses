//
//  SubCategories.swift
//  Courses
//
//  Created by Baha Ganyev on 07.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation

class Subcategory: Decodable {
    var id: Int?
    var title: String?
    var parent: Int?
    var subcategory_image_url: String?
}
