//
//  NewItemsView.swift
//  toDo
//
//  Created by Atakan Toprakbasti on 3/7/24.
//

import SwiftUI

struct NewItemsView: View {
    @StateObject  var viewModel = NewItemsViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item").font(.system(size: 32)).bold().padding(.top, 100)
            
            Form {
                TextField("Title", text: $viewModel.title).textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate).datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields, and select a valid due date."))
            }
        }
    }
}

struct NewItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemsView(newItemPresented: Binding(get: { return true }, set:{ _ in}))
    }
}
