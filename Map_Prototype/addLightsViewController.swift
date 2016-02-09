//
//  addLightsViewController.swift
//  Map_Prototype
//
//  Created by Shared on 2/9/16.
//  Copyright © 2016 Shared. All rights reserved.
//

import UIKit
import CoreData

class addLightsViewController: UIViewController {
    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var idField: UITextField!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var descriptionField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: -
    // MARK: Actions
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func save(sender: AnyObject) {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        let name = nameField.text
        let id = idField.text
        
        if let nameEmpty = name?.isEmpty where nameEmpty == false {
            if let idEmpty = id?.isEmpty where idEmpty == false{
                // Create Entity
                let light = NSEntityDescription.insertNewObjectForEntityForName("Lights", inManagedObjectContext: context)
                
                // Populate Record
                light.setValue(nameField.text, forKey: "lightName")
                light.setValue(idField.text, forKey: "lightID")
                light.setValue(descriptionField.text, forKey: "lightDes")
                
                do {
                    // Save Record
                    try context.save()
                    
                    // Dismiss View Controller
                    dismissViewControllerAnimated(true, completion: nil)
                    //self.navigationController?.popViewControllerAnimated(true)
                    
                } catch {
                    let saveError = error as NSError
                    print("\(saveError), \(saveError.userInfo)")
                    
                    // Show Alert View
                    showAlertWithTitle("Warning", message: "Your light could not be saved.", cancelButtonTitle: "OK")
                }
                
            } else {
                // Show Alert View
                showAlertWithTitle("Warning", message: "light name and/or ID are empty", cancelButtonTitle: "OK")
            }
        }
        
    }//end of add light button function
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -
    // MARK: Helper Methods
    private func showAlertWithTitle(title: String, message: String, cancelButtonTitle: String) {
        // Initialize Alert Controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // Configure Alert Controller
        alertController.addAction(UIAlertAction(title: cancelButtonTitle, style: .Default, handler: nil))
        
        // Present Alert Controller
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
