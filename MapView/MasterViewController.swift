//
//  MasterViewController.swift
//  MapView
//
//  Created by jeff cohen on 9/22/15.
//  Copyright (c) 2015 JBC. All rights reserved.
//

import UIKit


var cities = [Dictionary<String,String>()]

var activeCity = -1


class MasterViewController: UITableViewController {


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("cities", ofType: "txt")
        
        let text = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        
        var textArray = text.componentsSeparatedByString("\n")
        
        cities.removeAtIndex(0)
        
        for (var i=0; i < textArray.count-1; i++) {
            
            textArray[i] = textArray[i].stringByReplacingOccurrencesOfString(" +", withString: " *")
            
            textArray[i] = textArray[i].stringByReplacingOccurrencesOfString(" -", withString: "*-")
            
            var symbolArray = textArray[i].componentsSeparatedByString("*")
            
            symbolArray[0] = symbolArray[0].stringByReplacingOccurrencesOfString(" ", withString: "")
            
            symbolArray[0] = symbolArray[0].stringByReplacingOccurrencesOfString(",", withString: ", ")
            
            cities.append(["name":symbolArray[0],"lat":symbolArray[1],"lon":symbolArray[2]])
            
        }
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        activeCity = indexPath.row
        
        return indexPath
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
        
        cell.textLabel?.text = cities[indexPath.row]["name"]

        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

}

