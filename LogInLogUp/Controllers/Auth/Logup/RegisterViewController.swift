//
//  RegisterViewController.swift
//  LogInLogUp
//
//  Created by Yeskendir on 25.05.2023.
//

import UIKit
import FirebaseAuth
import Firebase
class RegisterViewController: UIViewController {

    let scrollView:UIScrollView = {
       let scrollbview = UIScrollView()
        scrollbview.clipsToBounds = true
        return scrollbview
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image  = UIImage(systemName: "person.circle")
        image.contentMode = .scaleAspectFit
        image.tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        
        // Apply gradient background color
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = image.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        image.layer.insertSublayer(gradientLayer, at: 0)
        
        // Apply shadow
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowRadius = 7
        image.layer.shadowOpacity = 0.4
        image.layer.shadowOffset = CGSize(width: 2, height: 2)
        return image
    }()
    
    private let firstNameField: UITextField = {
        let firstName = UITextField()
        firstName.autocapitalizationType = .none
        firstName.autocorrectionType = .no
        firstName.layer.cornerRadius = 12
        firstName.layer.borderWidth = 1
        firstName.returnKeyType = .continue
        firstName.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        firstName.textColor = .white
        
        // Customize the placeholder text color
        let placeholderText = "Firts name"
        let placeholderColor = UIColor.systemCyan // Desired color for the placeholder text

        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        firstName.attributedPlaceholder = attributedPlaceholder
        
        firstName.leftView =  UIView(frame: CGRect(x: 0, y: 0, width: 13, height: 0))
        firstName.leftViewMode = .always
        
        // making look beautiful 3D
        firstName.layer.shadowRadius = 7
        firstName.layer.shadowOpacity = 0.4
        firstName.layer.shadowOffset = CGSize(width: 2, height: 2)
        firstName.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
       return firstName
    }()
    private let secondNameField: UITextField = {
        let secondName = UITextField()
        secondName.autocapitalizationType = .none
        secondName.autocorrectionType = .no
        secondName.layer.cornerRadius = 12
        secondName.layer.borderWidth = 1
        secondName.returnKeyType = .continue
        secondName.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        secondName.textColor = .white
        
        // Customize the placeholder text color
        let placeholderText = "Second name"
        let placeholderColor = UIColor.systemCyan // Desired color for the placeholder text

        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        secondName.attributedPlaceholder = attributedPlaceholder
        
        secondName.leftView =  UIView(frame: CGRect(x: 0, y: 0, width: 13, height: 0))
        secondName.leftViewMode = .always
        
        secondName.layer.shadowRadius = 7
        secondName.layer.shadowOpacity = 0.4
        secondName.layer.shadowOffset = CGSize(width: 2, height: 2)
        secondName.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
       return secondName
    }()
    
    
    let emailField: UITextField = {
        let emailField = UITextField()
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        emailField.layer.cornerRadius = 12
        emailField.layer.borderWidth = 1
        emailField.returnKeyType = .continue
        emailField.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        emailField.textColor = .white
        
        // Customize the placeholder text color
        let placeholderText = "Your e-mail..."
        let placeholderColor = UIColor.systemCyan // Desired color for the placeholder text

        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        emailField.attributedPlaceholder = attributedPlaceholder
        
        emailField.leftView =  UIView(frame: CGRect(x: 0, y: 0, width: 13, height: 0))
        emailField.leftViewMode = .always
        emailField.layer.shadowRadius = 7
        emailField.layer.shadowOpacity = 0.4
        emailField.layer.shadowOffset = CGSize(width: 2, height: 2)
        emailField.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
       return emailField
    }()

    
    let passwordField: UITextField = {
        let password = UITextField()
        password.autocapitalizationType = .none
        password.autocorrectionType = .no
        password.layer.cornerRadius = 12
        password.layer.borderWidth = 1
        password.returnKeyType = .continue
        password.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        password.textColor = .white
        
        // Customize the placeholder text color
        let placeholderText = "Create password"
        let placeholderColor = UIColor.systemCyan // Desired color for the placeholder text

        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        password.attributedPlaceholder = attributedPlaceholder
        
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: 0))
        password.leftViewMode = .always
        password.isSecureTextEntry = true
        
        password.layer.shadowRadius = 7
        password.layer.shadowOpacity = 0.4
        password.layer.shadowOffset = CGSize(width: 2, height: 2)
        password.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
       return password
    }()
 
    
    let RegisterButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitleColor(.systemCyan, for: .normal)
        button.layer.masksToBounds = false
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        // Apply gradient background color
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = button.bounds
//        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
//        button.layer.insertSublayer(gradientLayer, at: 0)
//
        // Apply shadow
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 7
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        return button
    }()
    
//    MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        title = "Log In"
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(RegisterButton)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(secondNameField)
        emailField.delegate = self
        passwordField.delegate = self
        
        imageView.isUserInteractionEnabled = true
        scrollView.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePicture))
        imageView.addGestureRecognizer(gesture)
        
    }
    
    //    MARK: - Override Layouts
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let size = scrollView.width/3
        imageView.frame = CGRect(x: (scrollView.width-size)/2,
                                 y: 100,
                                 width: size,
                                 height: size)
        
        imageView.layer.cornerRadius = imageView.width/2.0
        
        firstNameField.frame = CGRect(x: 30,
                                      y: imageView.bottom+20,
                                      width: scrollView.width-60,
                                      height: 52)
        
        secondNameField.frame = CGRect(x: 30,
                                      y: firstNameField.bottom+20,
                                      width: scrollView.width-60,
                                      height: 52)
        
        emailField.frame = CGRect(x: 30,
                                  y: secondNameField.bottom+20,
                                  width: scrollView.width-60,
                                  height: 52)
        
        passwordField.frame = CGRect(x: 30,
                                     y: emailField.bottom+20,
                                     width: scrollView.width-60,
                                     height: 52)
        
        
        RegisterButton.frame = CGRect(x: 30,
                                   y: passwordField.bottom+20,
                                   width: scrollView.width-60,
                                   height: 40)
    }
    
    
    @objc func didTapChangeProfilePicture() {
        presentPhotoActionSheet()    }
    
    @objc func didTapRegisterButton(){
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        firstNameField.resignFirstResponder()
        secondNameField.resignFirstResponder()
        
        guard let firstName = firstNameField.text,
              let secondName = secondNameField.text,
              let email = emailField.text,
              let password = passwordField.text,
              !email.isEmpty,
              !password.isEmpty,
              !firstName.isEmpty,
              !secondName.isEmpty,
              password.count >= 6 else {
            alertUserLoginError()
            return
        }
        
    }
    
    // MARK: - Firebase Log in
    
    
    func alertUserLoginError(){
        let alert = UIAlertController(title: "Woops!", message: "Please enter correct information", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField{
            didTapRegisterButton()
        }
        return true
    }
}
