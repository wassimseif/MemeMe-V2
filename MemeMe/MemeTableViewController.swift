

import Foundation
import UIKit

class MemeTableViewController: UITableViewController {
    
    var memes: [Meme]!
    var object : UIApplicationDelegate?
    var appDelegate : AppDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Sent Memes"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "presentMemeEditor")
         object = UIApplication.sharedApplication().delegate
         appDelegate = object as! AppDelegate
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        memes = appDelegate!.memes
        if (memes.count == 0) {
            presentMemeEditor()
        }
        else {
            tableView.reloadData()
        }
    }
    
    /**
     Presents the Meme editor view controller
     */
    func presentMemeEditor() {
        var memeEditorController:MemeEditorViewController
        memeEditorController = self.storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        presentViewController(memeEditorController, animated: true, completion: nil)
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            
            appDelegate!.memes.removeAtIndex(indexPath.row)
            memes.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
    // MARK:- Table view delegate and datasource methods
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeCell") as UITableViewCell!
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
        memeDetailViewController.indexOfSelectedMeme = indexPath.row
        navigationController!.pushViewController(memeDetailViewController, animated: true)
        
    }
    
}
