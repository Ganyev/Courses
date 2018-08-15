//
//  ServerManager.swift
//  Courses
//
//  Created by Baha Ganyev on 07.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation
import Alamofire

class ServerManager: HTTPRequestManager {
    static let shared = ServerManager()
    
    func getCategories(completion: @escaping ([Category]) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: Constants.Network.EndPoint.categories, completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode([Category].self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    
    func getSubCategories(categoryid: Int, completion: @escaping ([Subcategory]) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: Constants.Network.EndPoint.subcategories(by: categoryid), completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode([Subcategory].self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    
    func getCoursesList(subcategoryid: Int, completion: @escaping ([CourseBase]) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: Constants.Network.EndPoint.courseList(by: subcategoryid), completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode([CourseBase].self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    
    func getCoursesDetail(courseid: Int, completion: @escaping (CourseDetail) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: Constants.Network.EndPoint.courseDetail(by: courseid), completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode(CourseDetail.self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    
    func getPaginatedListOfCourses(courseid: Int, completion: @escaping ([ResultList]) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: Constants.Network.EndPoint.coursePaginatedDetail(by: courseid), completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode(Result.self, from: data)
                completion(result.results)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    
    func getNews(completion: @escaping ([NewsResult]) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: Constants.Network.EndPoint.news, completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode(News.self, from: data)
                completion(result.results)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
}
