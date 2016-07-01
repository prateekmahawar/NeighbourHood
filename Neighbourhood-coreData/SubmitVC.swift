//
//  SubmitVC.swift
//  Neighbourhood-coreData
//
//  Created by Prateek Mahawar on 01/07/16.
//  Copyright © 2016 Prateek Mahawar. All rights reserved.
//

import UIKit
import CoreData

class SubmitVC: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    @IBOutlet weak var postDesc: UITextField!
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    var imagePicker:UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.layer.cornerRadius = imgView.frame.width/2
        imgView.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        imgView.image = image
    }
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        }
    @IBAction func addPicBtnPressed(sender:UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    @IBAction func submitBtnPressed(sender: AnyObject) {
        if let title = postTitle.text where title != "" , let desc = postDesc.text where desc != "" , let image = imgView.image where image != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("PostCell", inManagedObjectContext: context)!
            let postCell = PostCell(entity: entity, insertIntoManagedObjectContext: context)
            postCell.postTitle = title
            postCell.postDesc = desc
            postCell.setImage(image)
            
            context.insertObject(postCell)
            do{
                try context.save()
            } catch {
                print("Error")
            }
            dismissViewControllerAnimated(true, completion: nil)
        }
        
        }
    
}
