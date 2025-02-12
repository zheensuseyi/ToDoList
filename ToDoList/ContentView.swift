//
//  ContentView.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/6/25.
//

import SwiftUI

// Home Screen
struct ContentView: View {
    // getting viewmodel which was initalized in viewmodel already
    @ObservedObject var vm: ToDoListGameViewModel
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
                    // calling a seperate file here which handles the display of tasks
                    AspectVGrid(vm: vm)
                }
                // New task creation button, which will take you to the task creation screen
                NavigationLink(destination: TaskCreatorView(vm: vm)){
                    Label("Create New Task", systemImage: "app.badge")
                }
                // some padding on the button so its not at the very bottom
                .padding()
            }
            // applying this font to everything that doesn't have a specific font already
            .font(.title2)
        }
    }
}

#Preview {
    ContentView(vm: ToDoListGameViewModel())
}


