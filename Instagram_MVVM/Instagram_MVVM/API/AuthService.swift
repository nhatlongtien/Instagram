//
//  AuthService.swift
//  Instagram_MVVM
//
//  Created by NGUYENLONGTIEN on 3/7/21.
//

import Foundation
import UIKit
import Firebase

struct AuthService {
    static let instance = AuthService()
    
    func registerUser(withUser user:UserModel, completion:@escaping(_ result:Bool) -> Void){
        ImageUploader.instance.uploadImage(image: user.profileImage) { (success, imageUrl) in
            Auth.auth().createUser(withEmail: user.email, password: user.passwprd) { (result, error) in
                if error != nil{
                    print("Debug: Failed to create user: \(error?.localizedDescription)")
                    completion(false)
                }
                guard let uid = result?.user.uid else {return}
                let data: [String:Any] = [
                    "email": user.email,
                    "password": user.passwprd,
                    "fullname": user.fullname,
                    "username": user.username,
                    "imageUrl": imageUrl,
                    "uid": uid
                ]
                Firestore.firestore().collection("users").document(uid).setData(data)
                completion(true)
            }
        }
    }
}
