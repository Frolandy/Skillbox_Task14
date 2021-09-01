//
//  DBService.swift
//  Task14
//
//  Created by Андрей Фролов on 20.07.2021.
//

protocol DBService{
    func saveModel(model: TaskModel)
    func getModels() -> [TaskModel]
    func removeModel(model: TaskModel)
}
