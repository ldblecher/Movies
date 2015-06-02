//
//  Movie.swift
//  MovieList
//
//  Created by Lee D Blecher on 6/2/15.
//  Copyright (c) 2015 Lee D Blecher. All rights reserved.
//

import UIKit

class Movie: NSObject {
   
    var dict: NSDictionary
    
    init(dictionary: NSDictionary){
        dict = dictionary
    }
    
    var title: NSString{
        get {
            return dict["title"] as! NSString
        }
    }
    
    var year: NSNumber{
        get {
            return dict["year"] as! NSNumber
        }
    }
    
    var mpaa_rating: NSString{
        get {
            return dict["mpaa_rating"] as! NSString
        }
    }
    
    var runtime: NSString

    
}
