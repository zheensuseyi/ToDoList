//
//  ContentView.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/6/25.
//

import SwiftUI

// FIXME: Expand so users can see task description
// FIXME: Fix UI, clean up code
struct ContentView: View {
    @ObservedObject var vm: ToDoListGameViewModel
    @State private var completeTask: Bool = false
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
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
                        .foregroundColor(.black)
                    Spacer()
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(vm.taskList) {
                                item in
                                
                               /* Text("Task \(item.id + 1): \(item.taskName)")
                                    .font(.title)
                                    .foregroundColor(vm.colorConversion(item.color))
                            */
                                NavigationLink(destination: TaskDescriptionView(description: item.taskDescription)){
                                    Text("Task \(item.id + 1) : \(item.taskName)")
                                }
                                .foregroundColor(vm.colorConversion(item.color))
                                .font(.title2)
                                Button("✅") {
                                    vm.completeTask(id: item.id)
                                    completeTask.toggle()
                                }
                                .font(.largeTitle)
                            }
                        }
                    }
                    .padding()
                    Spacer()
                    NavigationLink(destination: TaskCreatorView(vm: vm)){
                        Label("Create New Task", systemImage: "app.badge")
                    }
                    .font(.title2)
                }
                .alert(isPresented: $completeTask, content: { vm.alert })
                .padding()
            }
        }
    }
}


#Preview {
    ContentView(vm: ToDoListGameViewModel())
}


