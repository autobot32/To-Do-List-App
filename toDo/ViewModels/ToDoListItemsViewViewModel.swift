//
//  ToDoListItemsViewViewModel.swift
//  toDo
//
//  Created by Atakan Toprakbasti on 3/7/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemsViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("todos").document(newItem.id).setData(newItem.asDictionary())
        
    }
}
