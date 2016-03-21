

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {

    @IBOutlet weak var memedImageView: UIImageView!
    
    var memedImage:UIImage!
    var indexOfSelectedMeme : Int?
    var object : UIApplicationDelegate?
    var appDelegate : AppDelegate?
    
    
    //When an image is selected this image will fill the image view of this detail view controller
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        memedImageView.image = memedImage
       navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .Plain, target: self, action: "deleteButtonTapped")
        object = UIApplication.sharedApplication().delegate
        appDelegate = object as? AppDelegate

    }
    
    func deleteButtonTapped (){
        appDelegate?.memes.removeAtIndex(indexOfSelectedMeme!)
        
        if appDelegate?.memes.count != 0 {
            navigationController?.popToRootViewControllerAnimated(true)
            return
            
        }
        
        var memeEditorController:MemeEditorViewController
        memeEditorController = self.storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        presentViewController(memeEditorController, animated: true, completion: nil)
        
    }
    
}
