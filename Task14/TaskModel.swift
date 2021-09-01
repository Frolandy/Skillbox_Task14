//
//  TaskModel.swift
//  Task14
//
//  Created by Андрей Фролов on 20.07.2021.
//

struct TaskModel{
    let id: String
    let name: String
    
    static func fromRealmModel(realmModel: RealmTaskModel) -> TaskModel{
        let model = TaskModel(id: realmModel.taskId, name: realmModel.name)
        
        return model
    }
}
