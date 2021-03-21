//
//  ImageUploader.swift
//  Instagram_MVVM
//
//  Created by NGUYENLONGTIEN on 3/7/21.
//

import Foundation
import UIKit
import FirebaseStorage
class ImageUploader{
    static let instance = ImageUploader()
    
    func uploadImage(image:UIImage, completion:@escaping(_ result:Bool,_ imageURL:String?) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.75) else {return}
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(fileName)")
        
        ref.putData(imageData, metadata: nil) { (metaData, error) in
            if error != nil{
                print("DEBUG: Failed to upload image: \(error?.localizedDescription)")
                completion(false, nil)
            }
            ref.downloadURL { (url, error) in
                guard let imageURL = url?.absoluteString else {return}
                completion(true, imageURL)
                
            }
        }
    }
}
