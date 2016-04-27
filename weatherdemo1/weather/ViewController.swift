//
//  ViewController.swift
//  weather
//
//  Created by Pawan Jhurani on 22/04/16.
//  Copyright (c) 2016 wittybrains. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    var jsonRes:NSArray = NSArray()
    @IBOutlet var weathertableview: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
           //api call
        let urlString = NSString(format: "https://data-62110.onmodulus.net/data.json")
        
        print("get wallet balance url string is \(urlString)")
        //let url = NSURL(string: urlString as String)
        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: NSString(format: "%@", urlString) as String)
        request.HTTPMethod = "GET"
        request.timeoutInterval = 30
        
        var response:NSURLResponse?
        do {
        let data = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
        
        // Parse the data
        
        do {
        
        jsonRes = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as! NSArray
            print(jsonRes)
            print(jsonRes[0]["day"])
        
     
        
        }
        catch {
        print(error)
        }
        
        }
        catch {
            print(error)
        }
   
    
    

        // Do any additional setup after loading the view, typically from a nib.
    }
       //tableview delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //make sure you use the relevant array sizes
        print(jsonRes.count)
        return jsonRes.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> tableTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reusecell", forIndexPath: indexPath) as! tableTableViewCell
   
        // Configure the cell...
        cell.day.text = ("\((jsonRes[indexPath.row])["day"]!as! String)   \((jsonRes[indexPath.row])["date"]!as! String)   \((jsonRes[indexPath.row])["weather"]!as! String)   \((jsonRes[indexPath.row])["temp"]!as! String)")
        
        return cell
    }
    



}

