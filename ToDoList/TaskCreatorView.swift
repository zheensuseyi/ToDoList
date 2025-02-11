//
//  TaskCreatorView.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/7/25.
//

import SwiftUI

struct TaskCreatorView: View {
    @ObservedObject var vm: ToDoListGameViewModel
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var isImportant: Bool = false
    @State private var taskCreated: Bool = false
    var body: some View {
        VStack {
            Text("Task Creator")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            TextField(
                "Enter Task Name",
                text: $name
            )
            .font(.title2)
            .multilineTextAlignment(.center)
            
            Spacer()
            TextField(
                "Enter Task Description",
                text: $description
            )
            .font(.title2)
            .multilineTextAlignment(.center)
            
            Spacer()
            Text("Is this task important?")
                .font(.title2)
            HStack {
                Button("Yes") {
                    isImportant = true
                }
                Button("No") {
                    isImportant = false
                }
            }
            
            
            Spacer()
            Button("Create New Task") {
                vm.createNewTask(name: name, description: description, isImportant: isImportant)
                taskCreated.toggle()
            }
            .font(.title2)
            .alert(isPresented: $taskCreated, content: { vm.taskCreated })
        }
        .font(.headline)
        .padding()
    }
}


#Preview {
    TaskCreatorView(vm: ToDoListGameViewModel())
}
