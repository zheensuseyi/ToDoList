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
            // wrap everything in vstack so it looks nice and tidy vertically
            VStack {
                // title
                Text("\(vm.title)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                // score
                Text("Score: \(vm.points)")
                Spacer()
                // scrollview for tasks, can add as many tasks as you want
                ScrollView {
                    AspectVGrid(vm: vm)
                }
                // New task creation button, which will take you to the task creation screen
                NavigationLink(destination: TaskCreatorView(vm: vm)){
                    Label("Create New Task", systemImage: "app.badge")
                }
                .padding()
            }
            .font(.title2)
        }
    }
}


#Preview {
    ContentView(vm: ToDoListGameViewModel())
}


