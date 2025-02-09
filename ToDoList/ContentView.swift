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
                        item in
                        HStack {
                            Text("TO DO: \(item.taskName)")
                                .foregroundColor(.red)
                            Button("✅") {
                                vm.completeTask(id: item.id)
                                completeTask.toggle()
                             //   Spacer()
                            }
                            
                            .font(.largeTitle)
                        }
                        
                    }
                    .font(.title2)
                    Spacer()
                    NavigationLink(destination: TaskCreatorView(vm: vm)){
                                                    Label("Create New Task", systemImage: "app.badge")
                                                }                }
                    
                 
                        .alert(isPresented: $completeTask, content: { vm.alert })
                        .padding()

                }
            }
        }
    }

 
#Preview {
    ContentView(vm: ToDoListGameViewModel())
}
