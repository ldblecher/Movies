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
    
    var year: Int{
        get {
            return dict["year"] as! Int
        }
    }
    
    var mpaa_rating: NSString{
        get {
            return dict["mpaa_rating"] as! NSString
        }
    }
    
    var runtime: NSString{
        get {
            var total_minutes = dict["runtime"] as! Int
            var hours = total_minutes/60
            var minutes = total_minutes%60
            var time_string = "\(hours) hrs. \(minutes) min."
            return time_string
        }
    }
    
    var ratings: NSDictionary{
        get {
            return dict["ratings"] as! NSDictionary
        }
    }
    
    var critics_score: Int{
        get {
            return ratings["critics_score"] as! Int
        }
    }
    
    var audience_score: Int{
        get {
            return ratings["audience_score"] as! Int
        }
    }
    
    var synopsis: NSString{
        get {
            return dict["synopsis"] as! NSString
        }
    }

    var posters: NSDictionary{
        get {
            return dict["posters"] as! NSDictionary
        }
    }
    
    var thumbnail_url: NSURL{
        get {
            return NSURL(string: posters["detailed"] as! NSString as String)!
        }
    }
    
    var poster_url: NSURL{
        get {
            return NSURL(string: posters["original"] as! NSString as String)!
        }
    }
    
    var abridged_cast: NSArray{
        get {
            return dict["abridged_cast"] as! NSArray
        }
    }
    
    var cast_list: NSString{
        get {
            var list = ""
            var i = 0
            for member in abridged_cast {
                var name = member["name"] as! String
                list = list + name + ", "
            }
            return list.substringToIndex(advance(list.startIndex, count(list)-2))
        }
    }
}
