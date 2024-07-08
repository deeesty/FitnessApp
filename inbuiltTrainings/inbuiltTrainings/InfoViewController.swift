//
//  InfoViewController.swift
//  inbuiltTrainings
//
//  Created by Наиль on 08.07.2024.
//

import UIKit

class InfoViewController: UIViewController {

    
    @IBOutlet weak var infoName: UILabel!
    
    @IBOutlet weak var infoImage: UIImageView!
    
    @IBOutlet weak var infoText: UITextView!
    
    var nameString: String?
    var infoTextString: String?
    var infoImageText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoName.text = nameString
        self.infoText.text = infoTextString
        self.infoImage.image = UIImage(named: infoImageText!)
        // Do any additional setup after loading the view.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
