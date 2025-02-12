//
//  TaskCreatorView.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/7/25.
//

import SwiftUI
// screen for task creation
struct TaskCreatorView: View {
    // getting our viewmodel again
    @ObservedObject var vm: ToDoListGameViewModel
    // every variable needed to create a new task, will be passed thru a function to the viewmodel
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var isImportant: Bool = false
    @State private var taskCreated: Bool = false
    var body: some View {
        // vstack for nice alignment
        VStack {
            // title
            Text("Task Creator")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            
            // getting user input for the task name
            TextField(
                "Enter Task Name",
                text: $name
            )
            .font(.title2)
            .multilineTextAlignment(.center)
            Spacer()
            
            // getting user input for task description
            TextField(
                "Enter Task Description",
                text: $description
            )
            .font(.title2)
            .multilineTextAlignment(.center)
            Spacer()
            
            // yes/no for if the task is important, if yes, then task text color will be red
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
            
            // button to finialize creating a new task
            Button("Create New Task") {
                vm.createNewTask(name: name, description: description, isImportant: isImportant)
                // alert gets toggled here
                taskCreated.toggle()
            }
            .font(.title2)
            // alert for task creation from the viewmodel
            .alert(isPresented: $taskCreated, content: { vm.taskCreated })
        }
        .font(.headline)
        .padding()
    }
}


#Preview {
    TaskCreatorView(vm: ToDoListGameViewModel())
}
