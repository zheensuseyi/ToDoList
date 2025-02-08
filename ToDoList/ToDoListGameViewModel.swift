//
//  ToDoListGameViewModel.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/6/25.
//

import SwiftUI
// FIXME: figure out why taskList isnt updating 
class ToDoListGameViewModel: ObservableObject{
    @Published var game: ToDoListGame = ToDoListGame()
    var points: Int {
        return game.points
    }
    var title: String {
        return game.title
    }
    @Published var taskList: [ToDoListGame.Task]
    init(game: ToDoListGame) {
        taskList = []
        self.game = game
        self.taskList = game.taskList
    }
    var alert: Alert {
        Alert(title: Text("You just completed your task!"), message: Text("Your score is now \(points)"), dismissButton: .default(Text("Dismiss")))
    }

    func createNewTask(name: String, description: String, isImportant: Bool) {
        game.createNewTask(taskName: name, taskDescription: description, isImportant: isImportant)
        taskList = game.taskList
    }

    func completeTask(id: Int) {
        game.completeTask(id: id)
        taskList = game.taskList
    }
    
    func syncWithGame() {
        taskList = game.taskList
    }
    
}

