//
//  AddCafeTableViewController.swift
//  MessingWithTableView
//
//  Created by Ravil on 28.11.2021.
//

import UIKit

class AddCafeTableViewController: UITableViewController {
    
    @IBOutlet weak var imageOfCafe: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // по нажатию на любую область, клавиатура скрывается, кроме ячейки по индексу 0 (фото)
        if indexPath.row == 0 {
            let cameraIcon = UIImage(named: "camera")
            let galleryIcon = UIImage(named: "gallery")
            
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Камера", style: .default) { _ in
                self.chooseImagwePicker(source: .camera)
            }
            
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let gallery = UIAlertAction(title: "Галерея", style: .default) { _ in
                self.chooseImagwePicker(source: .photoLibrary)
            }
            
            gallery.setValue(galleryIcon, forKey: "image")
            gallery.setValue(CATextLayerTruncationMode.end, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(gallery)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true, completion: nil)
        } else {
            view.endEditing(true)
        }
    }
    
}

// MARK: - Text field delegate

extension AddCafeTableViewController: UITextFieldDelegate {
    
    // hide keyboard with Done button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

// MARK: - Work with image

extension AddCafeTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagwePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageOfCafe.image = info[.editedImage] as? UIImage
        imageOfCafe.contentMode = .scaleAspectFill
        imageOfCafe.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
}
