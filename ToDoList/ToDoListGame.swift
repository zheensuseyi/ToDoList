//
//  ToDoListGame.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/6/25.
//

import Foundation

struct ToDoListGame {
    private(set) var points: Int = 0
    private(set) var title: String = "To Do List For Today..."
    var taskList: [Task]
    private(set) var idCounter = 0
    
    init() {
        taskList = []
        taskList.append(Task(id: idCounter, taskName: "Wake UP", taskDescription: "Get out of bed.", isImportant: true))
    }
    
    mutating func createNewTask(taskName: String, taskDescription: String, isImportant: Bool) {
        idCounter += 1
        let newTask = Task(id: idCounter, taskName: taskName, taskDescription: taskDescription, isImportant: isImportant)
        taskList.append(newTask)
        print("Task Created: \(newTask)")
    }
    
    mutating func completeTask(id: Int) {
        print("Task Removed")
        taskList.removeAll { $0.id == id }
        points += 1
    }
    
    struct Task: Identifiable, Equatable {
        var id: Int
        var taskName: String
        var taskDescription: String
        var isImportant: Bool
        var isSelected: Bool = false
        init(id: Int, taskName: String, taskDescription: String, isImportant: Bool) {
            self.id = id
            self.taskName = taskName
            self.taskDescription = taskDescription
            self.isImportant = isImportant
        }
    }
}
