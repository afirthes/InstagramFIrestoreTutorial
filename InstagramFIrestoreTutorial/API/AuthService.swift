//
//  AuthService.swift
//  InstagramFIrestoreTutorial
//
//  Created by Icetusk on 30.06.2024.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    static func registerUser(withCredentials credentials: AuthCredentials, completion: @escaping(Error?) -> Void) {
        
        ImageUploader.uploadImage(image: credentials.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { (result, error) in
                
                if let error = error {
                    print("Debug: failed to register user \(error.localizedDescription)")
                    return
                }
                
                guard let uid = result?.user.uid else { return }
                
                var data: [String: Any] = ["email": credentials.email,
                                           "fullname": credentials.fullname,
                                           "profileImageUrl": imageUrl,
                                           "uid": uid,
                                           "username": credentials.username]
                
                Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
                
            }
        }
        
    }
    
    static func logUserIn(withEmail email: String, password: String, completion: ((AuthDataResult?, (any Error)?) -> Void)?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
}
