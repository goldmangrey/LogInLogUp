//
//  Extensions.swift
//  LogInLogUp
//
//  Created by Yeskendir on 25.05.2023.
//

import Foundation
import UIKit

//MARK: - Extensions for  UITextField

extension LoginViewController {
    func setupView(){
        addSubViews()
//        setupLayout()
        
        view.backgroundColor = .systemCyan
    }
}

private extension LoginViewController {
    func addSubViews(){
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailFieldTextField)
        scrollView.addSubview(passwordFieldTextField)
        scrollView.addSubview(logInButton)
    }
}



//MARK: - Extension for  UIView

extension UIView {
    public var width: CGFloat {
        return self.frame.size.width
    }
    
    public var height: CGFloat {
        return self.frame.size.height
    }
    
    public var top: CGFloat {
        return self.frame.origin.y
    }
    
    public var bottom: CGFloat {
        return self.frame.size.height + self.frame.origin.y
    }
    
    public var left: CGFloat {
        return self.frame.origin.x
    }
    
    public var right: CGFloat {
        return self.frame.size.width + self.frame.origin.x
    }
    
    
    
}


//MARK: - Camera and Photo picker Extension
extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionSheet(){
        
        let actionSheet = UIAlertController(title: "Profile picture", message: "Please select photo for you profile pic", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take a photo", style: .default, handler: { [weak self] _ in
            
            self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose photo", style: .default, handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        
        present(actionSheet, animated: true)
        
    }
    
    func presentCamera(){
     let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc,animated: true)
    }
    
    func presentPhotoPicker(){
        let vc = UIImagePickerController()
           vc.sourceType = .photoLibrary
           vc.delegate = self
           vc.allowsEditing = true
           present(vc,animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        print(info)
        
//        self.imageView
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
