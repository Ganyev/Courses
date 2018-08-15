//
//  News.swift
//  Courses
//
//  Created by Baha Ganyev on 15.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation

class News: Decodable {
    var results: [NewsResult] = []
}

class NewsResult: Decodable {
    var id: Int?
    var title: String?
    var description: String?
    var news_image: String?
    var added: String?
}
