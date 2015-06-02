//
//  SearchTableViewController.swift
//  MovieList
//
//  Created by Lee D Blecher on 6/1/15.
//  Copyright (c) 2015 Lee D Blecher. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    let API = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?"
    let key = "apikey=yz8aght3p6b47r22wmkyezan"
    
    @IBOutlet var MovieTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var moviesArray: NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        var replaced_space = searchText.stringByReplacingOccurrencesOfString(" ", withString: "+")
        var final_url = NSURL(string: "\(API)+page_limit=3&page=1&q=\(replaced_space)&\(key)")
        var request = NSURLRequest(URL: final_url!)
        
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{ (response, data, error) in
            
        var errorValue: NSError?
        if let dictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &errorValue) as? NSDictionary {
            self.moviesArray = dictionary["movies"] as! NSArray
        }
        else{
            println("Network Error")
        }
        })
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return moviesArray.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("hello")
        let cell = MovieTableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieViewCell
        
        let movie = Movie(dictionary: moviesArray[indexPath.row] as! NSDictionary)
        
        cell.movieTitle.text = movie.title as String

        // Configure the cell...

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
