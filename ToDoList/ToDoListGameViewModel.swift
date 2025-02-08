//
//  ToDoListGameViewModel.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/6/25.
//

import SwiftUI

class ToDoListGameViewModel: ObservableObject{
    @Published var game: ToDoListGame = ToDoListGame()
    var points: Int {
        return game.points
    }
    var title: String {
        return game.title
    }
    var taskList: [ToDoListGame.Task] {
        return game.taskList
    }
    
    func createNewTask(name: String, description: String, isImportant: Bool) {
        game.createNewTask(taskName: name, taskDescription: description, isImportant: isImportant)
        syncWithGame()
    }

    func completeTask(id: Int) {
        game.completeTask(id: id)
        syncWithGame()
    }
    
    func syncWithGame() {
        _ = game.taskList
        _ = game.title
        _ = game.points
    }
    
}

