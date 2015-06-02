//
//  RestApiManager.swift
//  MovieList
//
//  Created by Lee D Blecher on 6/2/15.
//  Copyright (c) 2015 Lee D Blecher. All rights reserved.
//

import Foundation


//typealias ServiceResponse = (JSON, NSError?) -> Void
//
//class RestApiManager: NSObject {
//    static let sharedInstance = RestApiManager()
//    
//    let baseURL = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=9htuhtcb4ymusd73d4z6jxcj"
//    
//    func search(addon: String, onCompletion: (JSON) -> Void) {
//        let route = baseURL + addon
//        makeHTTPGetRequest(route, onCompletion: { json, err in
//            onCompletion(json as JSON)
//        })
//    }
//    
//    func makeHTTPGetRequest(path: String, onCompletion: ServiceResponse) {
//        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
//        
//        let session = NSURLSession.sharedSession()
//        
//        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
//            let json:JSON = JSON(data: data)
//            onCompletion(json, error)
//        })
//        task.resume()
//    }
//}