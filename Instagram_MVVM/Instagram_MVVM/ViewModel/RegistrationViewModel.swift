//
//  RegistrationViewModel.swift
//  Instagram_MVVM
//
//  Created by NGUYENLONGTIEN on 3/3/21.
//

import Foundation

struct RegistrationViewModel{
    var email:String?
    var password:String?
    var fullName:String?
    var userName:String?
    
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
}
