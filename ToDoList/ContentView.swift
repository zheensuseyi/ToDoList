//
//  ContentView.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/6/25.
//

import SwiftUI

// FIXME: clean up code by adding extensions 
struct ContentView: View {
    // getting viewmodel which was initalized in viewmodel already
    @ObservedObject var vm: ToDoListGameViewModel
    // variable for activating alert
    @State private var completeTask: Bool = false
    // default columns given by apple
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        // wrapping everything in a navigationstack to enable going to different screens
        NavigationStack {
            // zstack so I can set the bg color
            ZStack {
                Color(.gray)
                    .ignoresSafeArea()
                // wrap everything in vstack so it looks nice and tidy vertically
                VStack {
                    // title
                    Text("\(vm.title)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    // score
                    Text("Score: \(vm.points)")
                        .foregroundColor(.black)
                    Spacer()
                    // scrollview for tasks, can add as many tasks as you want
                    ScrollView {
                        // aligning everything in a lazyvgrid
                        LazyVGrid(columns: columns) {
                            // looping thru tasklist
                            ForEach(vm.taskList) {
                                item in
                                // tapping the task will lead you to another screen
                                // this screen only shows the task description of the task you clicked on
                                NavigationLink(destination: TaskDescriptionView(description: item.taskDescription)){
                                    Text("Task \(item.id + 1) : \(item.taskName)")
                                }
                                // task color, which changes depending on if its important
                                .foregroundColor(vm.colorConversion(item.color))
                                .font(.title2)
                                // Button to complete a task, deletes the task and give you +1 to your score
                                Button("✅") {
                                    vm.completeTask(id: item.id)
                                    // toggling the alert
                                    completeTask.toggle()
                                }
                                .font(.largeTitle)
                            }
                        }
                    }
                    .padding()
                    Spacer()
                    // New task creation button, which will take you to the task creation screen
                    NavigationLink(destination: TaskCreatorView(vm: vm)){
                        Label("Create New Task", systemImage: "app.badge")
                    }
                    .font(.title2)
                }
                // alert which pops if completeTask
                .alert(isPresented: $completeTask, content: { vm.alert })
                .padding()
            }
        }
    }
}

#Preview {
    ContentView(vm: ToDoListGameViewModel())
}


