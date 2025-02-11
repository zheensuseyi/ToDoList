//
//  AspectVGrid.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/11/25.
//

import SwiftUI

struct AspectVGrid: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var vm: ToDoListGameViewModel
    @State private var completeTask: Bool = false

    var body: some View {
        // aligning everything in a lazyvgrid
        LazyVGrid(columns: columns) {
            // looping thru tasklist
            ForEach(vm.taskList) {
                item in
                // tapping the task will lead you to another screen
                // this screen only shows the task description of the task you clicked on
                NavigationLink(destination: TaskDescriptionView(description: item.taskDescription)){
                    Text("Task \(item.id + 1) : \(item.taskName)")
                        .underline()
                }
                
                // task color, which changes depending on if its important
                .foregroundColor(vm.colorConversion(item.color))
                // Button to complete a task, deletes the task and give you +1 to your score
                Button("✅") {
                    vm.completeTask(id: item.id)
                    // toggling the alert
                    completeTask.toggle()
                }
                .font(.largeTitle)
            }
        }
        .alert(isPresented: $completeTask, content: { vm.alert })
        .animation(.easeInOut, value: completeTask)
    }
}


