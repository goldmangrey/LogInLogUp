//
//  LoginViewController.swift
//  LogInLogUp
//
//  Created by Yeskendir on 25.05.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    let scrollView:UIScrollView = {
       let scrollbview = UIScrollView()
        scrollbview.clipsToBounds = true
        return scrollbview
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image  = UIImage(named: "logoforregister")
        image.contentMode = .scaleAspectFit
        
        // Apply gradient background color
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = image.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        image.layer.insertSublayer(gradientLayer, at: 0)
        
        // Apply shadow
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = CGSize(width: 0, height: 2)
        image.layer.shadowOpacity = 0.5
        image.layer.shadowRadius = 4
        return image
    }()
    
    let emailField: UITextField = {
        let emailField = UITextField()
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        emailField.layer.cornerRadius = 12
        emailField.layer.borderWidth = 1
        emailField.returnKeyType = .continue
        emailField.layer.borderColor = UIColor.black.cgColor
        emailField.placeholder = "Your e-mail..."
        emailField.leftView =  UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        emailField.leftViewMode = .always
       return emailField
    }()

    
    let passwordField: UITextField = {
        let password = UITextField()
        password.autocapitalizationType = .none
        password.autocorrectionType = .no
        password.layer.cornerRadius = 12
        password.layer.borderWidth = 1
        password.returnKeyType = .continue
        password.layer.borderColor = UIColor.black.cgColor
        password.placeholder = "Password..."
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        password.leftViewMode = .always
        password.isSecureTextEntry = true
       return password
    }()
    
    let logInButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Press Me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 20
        // Apply gradient background color
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = button.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        button.layer.insertSublayer(gradientLayer, at: 0)
        
        // Apply shadow
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 4
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Log In"
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(logInButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(didTapRegister))
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let size = scrollView.width/3
        imageView.frame = CGRect(x: (scrollView.width-size)/2, y: 100, width: size, height: size)
        emailField.frame = CGRect(x: 30, y: imageView.bottom+10, width: scrollView.width-60, height: 52)
        passwordField.frame = CGRect(x: 30, y: emailField.bottom+10, width: scrollView.width-60, height: 52)
        logInButton.frame = CGRect(x: 30, y: passwordField.bottom+10, width: scrollView.width-60, height: 40)
    }
    
    @objc func didTapRegister(){
        let vc = RegisterViewController()
        vc.title = "Create account"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
