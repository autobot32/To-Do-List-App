//
//  NewItemsViewViewModel.swift
//  toDo
//
//  Created by Atakan Toprakbasti on 3/7/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemsViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        //Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Create model
        let newID = UUID().uuidString
        let newItem = ToDoListItem(id: newID, title: title, dueDate: dueDate.timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false)
        
        //Save model
        let db = Firestore.firestore()
        db.collection("users").document(uId).collection("todos").document(newID).setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}


