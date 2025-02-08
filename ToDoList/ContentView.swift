//
//  ContentView.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/6/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm: ToDoListGameViewModel
    @State private var completeTask: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.gray)
                    .ignoresSafeArea()
                VStack {
                    Text("\(vm.title)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Score: \(vm.points)")
                        .foregroundColor(.purple)
                    Spacer()
                    ForEach(vm.taskList) {
                        element in
                        HStack {
                            Text(element.taskName)
                            Button("✅") {
                                vm.completeTask(id: element.id)
                                completeTask.toggle()
                            }
                            .font(.largeTitle)
                        }
                    }
                    .font(.title2)
                    Spacer()
                    // Text("\(vm.taskList)")
                    // FIXME: This task should make the user go to the Task Creator View
                    NavigationLink(destination: TaskCreatorView(vm: ToDoListGameViewModel(game: ToDoListGame()))) {
                                        Label("Create New Task", systemImage: "app.badge")
                                    }                }
                .alert(isPresented: $completeTask, content: { vm.alert })
                .padding()
            }
        }
    }
        
}

#Preview {
    ContentView(vm: ToDoListGameViewModel(game: ToDoListGame()))
}
