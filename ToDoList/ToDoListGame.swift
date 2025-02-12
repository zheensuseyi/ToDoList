//
//  ToDoListGame.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/6/25.
//

import Foundation

// FIXME: clean up code, set variables to private 
struct ToDoListGame {
    // initalzing our private variables that are read only
    private(set) var points: Int = 0
    private(set) var title: String = "To Do List For Today..."
    private(set) var idCounter = 0
    
    // taskList array which is used throughout the app
    var taskList: [Task]
    
    // using this init to initalize taskList with a default task
    init() {
        taskList = []
        taskList.append(Task(id: idCounter, taskName: "Wake UP", taskDescription: "Get out of bed.", isImportant: true))
    }
    
    // function to create a new task, has a print statement for debugging, marked mutating because it updates taskList
    mutating func createNewTask(taskName: String, taskDescription: String, isImportant: Bool) {
        idCounter += 1
        let newTask = Task(id: idCounter, taskName: taskName, taskDescription: taskDescription, isImportant: isImportant)
        taskList.append(newTask)
        print("Task Created: \(newTask)")
    }
    
    // same thing but for removing a task
    mutating func completeTask(id: Int) {
        print("Task Removed")
        taskList.removeAll { $0.id == id }
        points += 1
    }
    
    // How tasks are made, this is a struct within the ToDoListGame (model)
    struct Task: Identifiable, Equatable {
        // task variables
        var id: Int
        var taskName: String
        var taskDescription: String
        var isImportant: Bool
        var isSelected: Bool = false
        var color: String = "blue"
        
        // initalizing all of the variables
        init(id: Int, taskName: String, taskDescription: String, isImportant: Bool) {
            self.id = id
            self.taskName = taskName
            self.taskDescription = taskDescription
            self.isImportant = isImportant
            // if the task is important, the color will be changed to "red"
            if isImportant {
                color = "red"
            }
        }
    }
}

