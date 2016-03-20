//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Marcel Salathé on 6/12/15.
//  Copyright (c) 2015 Marcel Salathé. All rights reserved.
//

import Foundation
import UIKit

class MemeTableViewController: UITableViewController {
    
    var memes: [Meme]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Sent Memes"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "presentMemeEditor")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
        if (memes.count == 0) {
            presentMemeEditor()
        }
        else {
            tableView.reloadData()
        }
    }
    
    func presentMemeEditor() {
        var memeEditorController:ViewController
        memeEditorController = self.storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! ViewController
        presentViewController(memeEditorController, animated: true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeCell") as! UITableViewCell!
        let customImageView = cell.viewWithTag(1) as! UIImageView
        let customTopLabel = cell.viewWithTag(2) as! UILabel
        let customBottomLabel = cell.viewWithTag(3) as! UILabel
        customImageView.image = memes[indexPath.row].memedImage
        customTopLabel.text =  memes[indexPath.row].topText
        customBottomLabel.text =  memes[indexPath.row].bottomText
        return cell
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let memeDetailViewController = storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        memeDetailViewController.memedImage = memes[indexPath.row].memedImage
        navigationController!.pushViewController(memeDetailViewController, animated: true)
        
    }
    
}
