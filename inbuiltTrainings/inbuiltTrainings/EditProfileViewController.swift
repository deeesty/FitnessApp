//
//  EditProfileViewController.swift
//  Profile
//
//  Created by Айрат Фахрутдинов on 09.07.2024.
//

import UIKit

protocol EditProfileDelegate: AnyObject {
    func didUpdateProfile(height: Double, weight: Double, profileImage: UIImage?)
}

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    
    weak var delegate: EditProfileDelegate?
    var profileImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        // Load current profile data if available
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let heightText = heightTextField.text, let height = Double(heightText),
              let weightText = weightTextField.text, let weight = Double(weightText) else {
            // Handle the error if the text fields are not properly filled out
            let alert = UIAlertController(title: "Ошибка", message: "Пожалуйста, введите корректные значения роста и веса.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        delegate?.didUpdateProfile(height: height, weight: weight, profileImage: profileImage)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func choosePhotoTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            profileImageView.image = selectedImage
            profileImage = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
}

