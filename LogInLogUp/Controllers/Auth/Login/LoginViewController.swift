//
//  LoginViewController.swift
//  LogInLogUp
//
//  Created by Yeskendir on 25.05.2023.
//

import UIKit

//MARK: - LoginViewController
class LoginViewController: UIViewController {
    
    let scrollView:UIScrollView = {
        let scrollbview = UIScrollView()
        scrollbview.clipsToBounds = true
        return scrollbview
    }()
    //MARK: - imageView
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
            image.layer.shadowRadius = 7
            image.layer.shadowOpacity = 0.4
            image.layer.shadowOffset = CGSize(width: 15, height: 15)
        return image
    }()
    
    //MARK: - emailField
//    private let emailField: UITextField = {
//        let emailField = UITextField()
//        emailField.autocapitalizationType = .none
//        emailField.autocorrectionType = .no
//        emailField.layer.cornerRadius = 12
//        emailField.layer.borderWidth = 1
//        emailField.returnKeyType = .continue
//        emailField.layer.borderColor = UIColor.black.cgColor
//        emailField.placeholder = "Your e-mail..."
//        emailField.leftView =  UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
//        emailField.leftViewMode = .always
//
//       return emailField
//    }()


    //MARK: - Private Property
    let emailFieldTextField = LoginTextField(placeholder: "Your email...")
    let passwordFieldTextField = LoginPasswordField(placeholder: "Your password...")

    
    //MARK: - passwordField
//    private let passwordField: UITextField = {
//        let password = UITextField()
//        password.autocapitalizationType = .none
//        password.autocorrectionType = .no
//        password.layer.cornerRadius = 12
//        password.layer.borderWidth = 1
//        password.returnKeyType = .continue
//        password.layer.borderColor = UIColor.black.cgColor
//        password.placeholder = "Password..."
//        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
//        password.leftViewMode = .always
//        password.isSecureTextEntry = true
//       return password
//    }()
    
    //MARK: - logInButton
        let logInButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitleColor(.systemCyan, for: .normal)
        button.layer.masksToBounds = false
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)

        
        // Apply shadow
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 7
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 15, height: 15)

        return button
    }()
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Log In"
        // Scroll View
        view.addSubview(scrollView)
        
//        scrollView.addSubview(imageView)
//        scrollView.addSubview(emailField)
//        scrollView.addSubview(passwordField)
//        scrollView.addSubview(logInButton)
        
        setupView()
        
        emailFieldTextField.delegate = self
        passwordFieldTextField.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(didTapRegister))
        logInButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        
    }
    
    //MARK: - viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let size = scrollView.width/3
        imageView.frame = CGRect(x: (scrollView.width-size)/2,
                                 y: 100,
                                 width: size,
                                 height: size)
        
//        emailField.frame = CGRect(x: 30,
//                                  y: imageView.bottom+10,
//                                  width: scrollView.width-60,
//                                  height: 52)
        emailFieldTextField.frame = CGRect(x: 30,
                                         y: imageView.bottom+30,
                                         width: scrollView.width-60,
                                         height: 60)
        
        passwordFieldTextField.frame = CGRect(x: 30,
                                     y: emailFieldTextField.bottom+10,
                                     width: scrollView.width-60,
                                     height: 60)
        
        logInButton.frame = CGRect(x: 250,
                                   y: passwordFieldTextField.bottom+20,
                                   width: 100,
                                   height: 40)
        
        
    }
    
    @objc func didTapRegister(){
        let vc = RegisterViewController()
        vc.title = "Create account"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapLoginButton(){
        emailFieldTextField.resignFirstResponder()
        passwordFieldTextField.resignFirstResponder()
        guard let email = emailFieldTextField.text, let password = passwordFieldTextField.text, !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            alertUserLoginError()
            return
        }
        
    }
    
    //Firebase Log in
    func alertUserLoginError(){
        let alert = UIAlertController(title: "Woops!", message: "Please enter correct information", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailFieldTextField {
            passwordFieldTextField.becomeFirstResponder()
        }
        else if textField == passwordFieldTextField{
            didTapLoginButton()
        }
        return true
    }
}


