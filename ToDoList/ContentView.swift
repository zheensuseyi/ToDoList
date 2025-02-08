//
//  ContentView.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/6/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm: ToDoListGameViewModel
    var body: some View {
        VStack {
            Text("\(vm.taskList)")
         //   Spacer()
            ForEach(vm.taskList) {
                element in
                HStack {
                    Text(element.taskName)
                    Button("Complete Task, \(element.id)") {
                        vm.completeTask(id: element.id)
                     }
                }
            }
           // Text("\(vm.taskList)")
            Button("Create New Task") {
                vm.createNewTask(name: "Bobby", description: "Testing New Task", isImportant: false)
            }
           

        }
        .padding()
    }
}

#Preview {
    ContentView(vm: ToDoListGameViewModel())
}
