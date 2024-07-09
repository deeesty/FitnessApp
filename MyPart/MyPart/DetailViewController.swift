
import UIKit

class DetailViewController: UIViewController {
    
    @IBAction func editButton(_ sender: Any) {
        performSegue(withIdentifier: "editSegue", sender: self)
    }
    @IBOutlet weak var titleReadLabel: UILabel!
    @IBOutlet weak var textReadLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleReadLabel.text = data[curIndex]
        textReadLabel.text = texts[curIndex]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
