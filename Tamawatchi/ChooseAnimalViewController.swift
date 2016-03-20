//
//  ViewController.swift
//  Tamawatchi
//
//  Created by Morgan Steffy on 3/15/16.
//  Copyright © 2016 Morgan Steffy. All rights reserved.
//

import UIKit
import Firebase



class ChooseAnimalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var animals: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchAnimals()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = self.animals[indexPath.row] as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func fetchAnimals(){
        
        print("fetching animal")
        
        let ref = Firebase(url: "https://brilliant-fire-4695.firebaseio.com")

        if ((ref.authData) != nil) {
            // user authenticated
            print("auth: \(ref.authData)")
        } else {
            // No user is signed in
        }
        
        //users/facebook:10154007100766419
        ref.childByAppendingPath("animals").observeEventType(.Value, withBlock: { snapshot in
        //self.ref.childByAppendingPath("animals").observeSingleEventOfType(.Value, withBlock: { snapshot in
            print("snapshot is: \(snapshot)")
            
            
            self.animals = snapshot.children.allObjects as! [FDataSnapshot]
            print("ANIMALS: \(self.animals)")
           
            
        })
        
    }
    
}