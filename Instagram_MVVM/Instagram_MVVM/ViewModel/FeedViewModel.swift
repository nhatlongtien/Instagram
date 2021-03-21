//
//  FeedViewModel.swift
//  Instagram_MVVM
//
//  Created by NGUYENLONGTIEN on 3/8/21.
//

import Foundation
import UIKit
import Firebase
struct FeedViewModel{
    func checkUserIsLogin(completion:@escaping(_ isLogin:Bool) -> Void){
        if Auth.auth().currentUser == nil{
            completion(false)
        }else{
            completion(true)
        }
    }
    func logout(completion:@escaping(_ isLogout:Bool) -> Void){
        do{
            try Auth.auth().signOut()
            completion(true)
        }catch{
            print("Debug: Failed to signOut")
            completion(false)
        }
        
    }
}
