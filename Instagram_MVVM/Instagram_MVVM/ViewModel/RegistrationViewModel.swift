//
//  RegistrationViewModel.swift
//  Instagram_MVVM
//
//  Created by NGUYENLONGTIEN on 3/3/21.
//

import Foundation
import UIKit
struct RegistrationViewModel{
    var email:String?
    var password:String?
    var fullName:String?
    var userName:String?
    var profileImage:UIImage?
    func isFormValidate() -> Bool{
        if !(email?.isValadateEmail())!{
            print("Email is not correct formatter")
            return false
        }
        if !(password?.isValadatePasswprd())!{
            print("Password is not correct formatter")
            return false
        }
        if !(fullName?.isValadateFullName())!{
            print("full name is not correct formatter")
            return false
        }
        if userName == ""{
            print("User name is empty")
            return false
        }
        return true
    }
    func registerUser(){
        guard let email = email else {return}
        guard let pass = password else {return}
        guard let fullname = fullName else {return}
        guard let username = userName else {return}
        guard let profileImage = self.profileImage else {return}
        let user:UserModel = UserModel(email: email, passwprd: pass, fullname: fullname, username: username, profileImage: profileImage)
        AuthService.instance.registerUser(withUser: user) { (success) in
            if success{
                print("Sucessfull")
            }else{
                print("Failed")
            }
        }
    }
}
