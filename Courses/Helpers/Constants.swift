//
//  Constants.swift
//  Courses
//
//  Created by Baha Ganyev on 07.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation
struct Constants {
    struct Network {
        struct EndPoint {
            static let categories = "categories"
            static func subcategories(by categoryid: Int) -> String {
                return "categories/\(categoryid)"
            }
            static func courseList(by subcategoryid: Int) -> String {
                return "subcategories/\(subcategoryid)"
            }
            static func courseDetail(by courseid: Int) -> String {
                return "courses/\(courseid)"
            }
            static func coursePaginatedDetail(by pageNumber: Int) -> String {
                return "courses/?page=\(pageNumber)&page_size=5"
            }
            static let news = "news"
            static let universities = "universities/categories/"
            static func newsDetail(by newsId: Int) -> String {
                return "news/\(newsId)"
            }
            
        }
        
        struct ErrorMessage {
            static let NO_INTERNET_CONNECTION = "No internet connection"
            static let UNABLE_LOAD_DATA = "Unable load data"
            static let NO_HTTP_STATUS_CODE = "Unable to get response HTTP status code"
            static let UNAUTHORIZED = "Unauthorized error"
        }
    }
}
