//
//  File.swift
//
//
//  Created by Jiahui Chen  on 3/1/23.
//

import Foundation
import Firebase
import FirebaseAuth

class FirestoreManager: ObservableObject {
    @Published var condition: String = ""
    private var db = Firestore.firestore()
    let user = Auth.auth().currentUser
    @Published var disease: String = ""
    
    func fetchData() {
        let db = Firestore.firestore()
        
        let docRef = db.collection("users").document(user?.uid ?? "")
        
        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    self.disease = data["disease"] as? String ?? ""
                }
            }
        }
    }
    
    init() {
        fetchData()
        print(self.disease)
    }
}
