//
//  ToDoListItemsView.swift
//  toDo
//
//  Created by Atakan Toprakbasti on 3/7/24.
//

import SwiftUI

struct ToDoListItemsView: View {
    @StateObject var viewModel = ToDoListItemsViewViewModel()
    let item: ToDoListItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title).font(.body)
                Text("Due \(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.footnote).foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle").foregroundColor(Color.green)
            }
        }
    }
}

#Preview {
    ToDoListItemsView(item: .init(id: "123", title: "Get milk", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: true))
}
