//
//  toDoApp.swift
//  toDo
//
//  Created by Atakan Toprakbasti on 3/5/24.
//
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

@main
struct toDoApp: App {
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
