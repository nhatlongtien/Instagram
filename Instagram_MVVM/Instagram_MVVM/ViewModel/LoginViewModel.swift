//
//  LoginViewModel.swift
//  Instagram_MVVM
//
//  Created by NGUYENLONGTIEN on 3/3/21.
//

import Foundation

struct LoginViewModel {
    var email:String?
    var password:String?
    
//    var formIsValidate:Bool{
//        if !(email?.isValadateEmail())!{
//            print("Email is wrong formatter")
//            return false
//        }
//        if !(password?.isValadatePasswprd())!{
//            print("Password is wrong formatter")
//            return false
//        }
//        return true
//    }
    func formIsValidate() -> Bool{
        if !email!.isValadateEmail(){
            print("Email is wrong formatter")
            return false
        }
        if !password!.isValadatePasswprd(){
            print("Password is wrong formatter")
            return false
        }
        return true
    }
}
