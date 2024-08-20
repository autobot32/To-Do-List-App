//
//  ToDoListViewViewModel.swift
//  toDo
//
//  Created by Atakan Toprakbasti on 3/7/24.
//

import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemsView = false
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users").document(userID).collection("todos").document(id).delete()
    }
}
