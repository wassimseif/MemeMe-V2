

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {

    @IBOutlet weak var memedImageView: UIImageView!
    
    var memedImage:UIImage!
    
    
    //When an image is selected this image will fill the image view of this detail view controller
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        memedImageView.image = memedImage
    }
    
}
