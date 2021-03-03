//
//  LoginController.swift
//  Instagram_MVVM
//
//  Created by NGUYENLONGTIEN on 3/2/21.
//

import UIKit

class LoginController: UIViewController {
    //MARK: Properties
    private var viewModel = LoginViewModel()
    private let iconPage:UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Instagram_logo_white")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    private let emailTextField:CustomTextField = {
        let tf = CustomTextField(placeholder: "Email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    private let passwordTextField:CustomTextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    private let loginButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(logInButtonWasPressed), for: .touchUpInside)
        return button
    }()
    private let dontHaveAccountButton:UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Don't have an account? ", secondPart: "Sign Up")
        button.addTarget(self, action: #selector(dontHaveAccountButtonWasPressed), for: .touchUpInside)
        return button
    }()
    private let forgetPasswordButton:UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Forget your password? ", secondPart: "Get help signing in")
        button.addTarget(self, action: #selector(forgetPasswordButtonWasPressed), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        print(1)
    }
    func configUI(){
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.barStyle = .black
        
        configureGradientView()
        
        view.addSubview(iconPage)
        iconPage.centerX(inView: self.view)
        iconPage.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        iconPage.setDimensions(height: 80, width: 120)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: iconPage.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(loginButton)
        loginButton.anchor(top: stack.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: self.view)
        dontHaveAccountButton.anchor(bottom:self.view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 20)
        
        view.addSubview(forgetPasswordButton)
        forgetPasswordButton.centerX(inView: self.view)
        forgetPasswordButton.anchor(top:self.loginButton.bottomAnchor, paddingTop: 30)
    }
    
    //MARK: Action
    @objc func logInButtonWasPressed(){
        viewModel.email = self.emailTextField.text
        viewModel.password = self.passwordTextField.text
        if !viewModel.formIsValidate(){
            return
        }
        print("Login button was pressed")
    }
    @objc func dontHaveAccountButtonWasPressed(){
        let registrationController = RegistrationController()
        self.navigationController?.pushViewController(registrationController, animated: true)
    }
    @objc func forgetPasswordButtonWasPressed(){
        print("Forget password button was pressed")
    }

}
