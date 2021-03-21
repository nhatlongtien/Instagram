//
//  RegistrationController.swift
//  Instagram_MVVM
//
//  Created by NGUYENLONGTIEN on 3/2/21.
//

import UIKit

class RegistrationController: UIViewController {
    //MARK: Properties
    private var viewModel = RegistrationViewModel()
    
    private let plusPhotoButton:UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 140/2
        button.clipsToBounds = true
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(plusPhotoButtonWasPressed), for: .touchUpInside)
        return button
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
    private let fullnameTextField:CustomTextField = {
        let tf = CustomTextField(placeholder: "Fullname")
        return tf
    }()
    private let usernameTextField:CustomTextField = {
        let tf = CustomTextField(placeholder: "Username")
        return tf
    }()
    private let signUpButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(signUpButtonWasPressed), for: .touchUpInside)
        return button
    }()
    private let alreadyHaveAnAccountButton:UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Already have an account? ", secondPart: "Log In")
        button.addTarget(self, action: #selector(alreadyHaveAnAccountButtonWasPressed), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    func configureUI(){
        configureGradientView()
        self.view.addSubview(plusPhotoButton)
        plusPhotoButton.setDimensions(height: 140, width: 140)
        plusPhotoButton.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        plusPhotoButton.centerX(inView: self.view)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullnameTextField, usernameTextField])
        stack.axis = .vertical
        stack.spacing = 20
        self.view.addSubview(stack)
        stack.anchor(top:self.plusPhotoButton.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        self.view.addSubview(signUpButton)
        signUpButton.anchor(top:stack.bottomAnchor,left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 20, paddingLeft: 32, paddingRight: 32)
        
        self.view.addSubview(alreadyHaveAnAccountButton)
        alreadyHaveAnAccountButton.anchor(bottom:self.view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 20)
        alreadyHaveAnAccountButton.centerX(inView: self.view)
    }
    //MARK: Action
    @objc func plusPhotoButtonWasPressed(){
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    @objc func signUpButtonWasPressed(){
        viewModel.email = self.emailTextField.text
        viewModel.password = self.passwordTextField.text
        viewModel.fullName = self.fullnameTextField.text
        viewModel.userName = self.usernameTextField.text
        if !viewModel.isFormValidate(){
            return
        }
        print("Sign in")
        viewModel.registerUser()
    }
    @objc func alreadyHaveAnAccountButtonWasPressed(){
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: Helper Method
    
}
//
extension RegistrationController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let imagePicker = info[.editedImage] as? UIImage else {return}
        viewModel.profileImage = imagePicker
        self.plusPhotoButton.setImage(imagePicker.withRenderingMode(.alwaysOriginal), for: .normal)
        self.plusPhotoButton.layer.borderWidth = 2
        self.plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        self.dismiss(animated: true, completion: nil)
    }
}
