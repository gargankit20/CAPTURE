
import UIKit
import Crashlytics

class SplashScreenVC: UIViewController {
    
    @IBOutlet weak var splashActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splashActivityIndicator.startAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
