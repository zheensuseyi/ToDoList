//
//  AspectVGrid.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/11/25.
//

import SwiftUI

// this is a helper file to display the tasks in the view
struct AspectVGrid: View {
    // default columns for lazyvgrid
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    // getting viewmodel again
    @ObservedObject var vm: ToDoListGameViewModel
    // alert variable that shows when a task is completed
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
                // making the button a little bigger
                .font(.largeTitle)
            }
        }
        // alert for when a task is completed
        .alert(isPresented: $completeTask, content: { vm.completeTask })
        // nice and smooth animation when task is completed 
        .animation(.easeInOut, value: completeTask)
    }
}


