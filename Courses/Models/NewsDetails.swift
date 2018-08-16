//
//  NewsDetails.swift
//  Courses
//
//  Created by Baha Ganyev on 16.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation

class NewsDetails: Decodable {
    var id: Int?
    var title: String?
    var description: String?
    var news_image: String?
    var added: String?
}
