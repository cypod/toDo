//
//  DetailViewController.swift
//  ToDoList
//
//  Created by Beau on 2014-10-13.
//  Copyright (c) 2014 Beau. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField! = UITextField()
    
    @IBOutlet var notesTextView: UITextView! = UITextView()
    
    var toDoData:NSDictionary = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.userInteractionEnabled = false
        notesTextView.userInteractionEnabled  = false
        
        titleTextField.text = toDoData.objectForKey("itemTitle") as String
        notesTextView.text = toDoData.objectForKey("itemNote") as String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteItem(sender: AnyObject) {
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemListArray:NSMutableArray = userDefaults.objectForKey("itemList") as NSMutableArray
        
        var mutableItemList:NSMutableArray = NSMutableArray()
        
        for dict:AnyObject in itemListArray {
            mutableItemList.addObject(dict as NSDictionary)
        }
        
        mutableItemList.removeObject(toDoData)
        
        userDefaults.removeObjectForKey("itemList")
        userDefaults.setObject(mutableItemList, forKey: "itemList")
        
        userDefaults.synchronize()
        
        self.navigationController.popToRootViewControllerAnimated( true )
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
