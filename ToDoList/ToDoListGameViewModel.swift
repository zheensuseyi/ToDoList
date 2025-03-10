//
//  ToDoListGameViewModel.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/6/25.
//

import SwiftUI

// FIXME: Figure out private variables and why i cant set them to private
class ToDoListGameViewModel: ObservableObject{
    // initizing variables, game model, taskList, points, and title
    // initalizing our model here
    @Published var game: ToDoListGame = ToDoListGame()
    
    // initalizing model variables
    var taskList: [ToDoListGame.Task] {
        return game.taskList
    }
    var points: Int {
        return game.points
    }
    var title: String {
        return game.title
    }
    
    // alert for completing a task for the view
    var completeTask: Alert {
        Alert(title: Text("You just completed your task!"), message: Text("Your score is now \(points)"), dismissButton: .default(Text("Dismiss")))
    }
    
    // alert for creating a task for the view
    var taskCreated: Alert {
        Alert(title: Text("New Task Created!"), message: Text("Check it out in the home screen"), dismissButton: .default(Text("Dismiss")))
    }
    
    // function to create new task, calls upon a function in the model
    func createNewTask(name: String, description: String, isImportant: Bool) {
        game.createNewTask(taskName: name, taskDescription: description, isImportant: isImportant)
    }
    
    // function to complete task, calls upon a function in the model
    func completeTask(id: Int) {
        game.completeTask(id: id)
    }
    
    // function for color conversion, used in the view, since color cant be initalized in our ToDoListGame file
    func colorConversion(_ taskColor: String) -> Color {
        switch taskColor {
        case "red":
            return Color.red
        case "blue":
            return Color.blue
        default:
            return Color.blue
        }
    }
    
}

