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
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
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
                .foregroundColor(.black)
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
                // Text("\(vm.taskList)")
                // FIXME: This task should make the user go to the Task Creator View
                Button("Create New Task") {
                    vm.createNewTask(name: name, description: description, isImportant: isImportant)
                }
            }
            .padding()
        }
    }
}

#Preview {
    TaskCreatorView(vm: ToDoListGameViewModel())
}
