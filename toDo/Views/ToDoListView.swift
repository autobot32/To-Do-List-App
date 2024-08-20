//
//  ToDoListView.swift
//  toDo
//
//  Created by Atakan Toprakbasti on 3/7/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    
    
    init(userID: String) {
        
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationView{
            VStack {
                List(items) { item in
                    ToDoListItemsView(item: item).swipeActions {
                        Button("Delete") {
                            viewModel.delete(id: item.id)
                        }
                        .tint(.red)
                    }
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemsView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemsView) {
                NewItemsView(newItemPresented: $viewModel.showingNewItemsView)
            }
        }
    }
        
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userID: "TWf01DhnUCQfVwTL3pusIlsrMsS2")
    }
    
}
