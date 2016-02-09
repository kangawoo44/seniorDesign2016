//
//  MapViewController.swift
//  Map_Prototype
//
//  Created by Shared on 2/1/16.
//  Copyright © 2016 Shared. All rights reserved.
//

import UIKit
import CoreData

class MapViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var mapScroll: UIScrollView!
    @IBOutlet var lightsTable: UITableView!
    @IBOutlet var btnEditMap: UIButton!
    @IBOutlet var btnLights: UIButton!
    
    var lights:[Lights]?
    
    let cellReuseID = "LightCell"
    
    var imageView = UIImageView() //make an image view for loading map image
    
    
    // MARK: -
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()     // Do any additional setup after loading the view.
        
               
        mapScroll.delegate = self
        
        let map = UIImage(named: "samplemap")

        imageView.userInteractionEnabled = true
        imageView.frame = CGRectMake(0, 0, map!.size.width, map!.size.height)
        imageView.image = map //load the map image to the image view
        //imageView.contentMode = UIViewContentMode.Center
        //let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "loadImage:")
        
        mapScroll.addSubview(imageView) //add the imageview as a subview of the scroll view (so users can pan image)
        mapScroll.contentSize = (map?.size)!
        //mapScroll.contentMode = UIViewContentMode.ScaleAspectFill
        
        let mapScrollFrame = mapScroll.frame
        let scaleWidth = mapScrollFrame.size.width / mapScroll.contentSize.width
        let scaleHeight = mapScrollFrame.size.height / mapScroll.contentSize.height
        let minScale = min(scaleHeight, scaleWidth)
        
        mapScroll.minimumZoomScale = minScale
        mapScroll.maximumZoomScale = 1
        mapScroll.zoomScale = minScale
        
        //centerMapScrollContents()
        
        
        //register cell's class for cell reuse
        lightsTable.registerClass(LightTableViewCell.self, forCellReuseIdentifier: cellReuseID)
        
        //set the data source and add the tableview to the view
        lightsTable.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        updateLights()
    }
    
    func updateLights(){
        //lights.removeAllObjects()
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        do{
            let request = NSFetchRequest(entityName: "Lights")
            let data = try context.executeFetchRequest(request)
            if data.count > 0 {
                for item in data as! [NSManagedObject]{
                    let name = item.valueForKey("lightName")
                    let id = item.valueForKey("lightID")
                    let desc = item.valueForKey("lightDes")
                }
            }
            self.lightsTable.reloadData()
        }catch{
            print("there has been an error retrieving data")
        }
    }
    
    
    // MARK: -
    // MARK: Actions
    @IBAction func btnScenes(sender: AnyObject) {
    }
    
    func centerMapScrollContents(){         //function to keep map image within bounds and centered
        
        let boundsSize = mapScroll.bounds.size
        var contentsFrame = imageView.frame
        
        if contentsFrame.size.width < boundsSize.width{
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2
        }else{
            contentsFrame.origin.x = 0
        }
        
        if contentsFrame.size.height < boundsSize.height{
                contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2
        }else{
            contentsFrame.origin.y = 0
        }

        imageView.frame = contentsFrame
    }
    
    func mapScrollDidZoom(mapScroll: UIScrollView){
        //everytime the user zooms in, the content is centered
        centerMapScrollContents()
    }
    
    func viewForZoomingInScrollView(mapScroll: UIScrollView) -> UIView? {
        //when zoomed in scroll view, show zoomed image view
        return imageView
    }
    

    // MARK: -
    // MARK: Prepare for Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addLightsSegue" {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: -
    // MARK: Table View Data Source Methods
    func tableView(lightsTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.lights?.count == nil{
                return 0
        }else{
            return self.lights!.count
        }
    }
    
    func tableView(lightsTable: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        //create cells
        let cell: LightTableViewCell = lightsTable.dequeueReusableCellWithIdentifier(cellReuseID, forIndexPath: indexPath) as! LightTableViewCell
        let light: Lights = self.lights![indexPath.row]
        
        cell.nameLabel.text = light.lightName
        cell.idLabel.text = light.lightID
        cell.descLabel.text = light.lightDes
        
        return cell
    }

    
    func tableView(lightsTable: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
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
