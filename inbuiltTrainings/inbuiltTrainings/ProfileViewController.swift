//
//  ProfileViewController.swift
//  Profile
//
//  Created by Айрат Фахрутдинов on 09.07.2024.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    
    var height: Double = 0.0 {
        didSet {
            heightLabel.text = "\(height) cm"
            updateBMI()
        }
    }
    
    var weight: Double = 0.0 {
        didSet {
            weightLabel.text = "\(weight) kg"
            updateBMI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editProfile))
        // Load initial profile data here if available
    }
    
    @objc func editProfile() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let editVC = storyboard.instantiateViewController(withIdentifier: "EditProfileViewController") as? EditProfileViewController {
            editVC.delegate = self
            navigationController?.pushViewController(editVC, animated: true)
        }
    }
    
    func updateBMI() {
        if height > 0 {
            let heightInMeters = height / 100
            let bmi = weight / (heightInMeters * heightInMeters)
            bmiLabel.text = String(format: "%.2f", bmi)
        } else {
            bmiLabel.text = "N/A"
        }
    }
}

extension ProfileViewController: EditProfileDelegate {
    func didUpdateProfile(height: Double, weight: Double, profileImage: UIImage?) {
        self.height = height
        self.weight = weight
        if let image = profileImage {
            self.profileImageView.image = image
        }
    }
}

