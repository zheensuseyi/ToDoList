//
//  TaskDescriptionView.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/10/25.
//

import SwiftUI

struct TaskDescriptionView: View {
    var description: String = "Task Description"
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            VStack {
                Text("Task Description")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                ScrollView {
                    Text("\(description)")
                }
                Spacer()
            }
        }
    }
}

#Preview {
    TaskDescriptionView()
}
