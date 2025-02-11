//
//  ToDoListGameViewModel.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/6/25.
//

import SwiftUI
// FIXME: figure out why taskList isnt updating
class ToDoListGameViewModel: ObservableObject{
    // initizing variables, game model, taskList, points, and title
    @Published var game: ToDoListGame = ToDoListGame()
    var taskList: [ToDoListGame.Task] {
        return game.taskList
    }
    var points: Int {
        return game.points
    }
    var title: String {
        return game.title
    }
    
    var alert: Alert {
        Alert(title: Text("You just completed your task!"), message: Text("Your score is now \(points)"), dismissButton: .default(Text("Dismiss")))
    }
    
    func createNewTask(name: String, description: String, isImportant: Bool) {
        game.createNewTask(taskName: name, taskDescription: description, isImportant: isImportant)
    }
    
    func completeTask(id: Int) {
        game.completeTask(id: id)
    }
    
    func colorConversion(_ taskColor: String) -> Color {
        switch taskColor {
        case "red":
            return Color.red
        case "black":
            return Color.black
        default:
            return Color.black
        }
    }
    
}

