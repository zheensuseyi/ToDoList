//
//  ToDoListGame.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/6/25.
//

import Foundation

struct ToDoListGame {
    private(set) var points: Int
    struct Task {
        var isCompleted: Bool = false
        var isImportant: Bool
        var isSelected: Bool = false
    }
}
