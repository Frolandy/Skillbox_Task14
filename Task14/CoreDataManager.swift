//
//  CoreDataManager.swift
//  Task14
//
//  Created by Андрей Фролов on 02.08.2021.
//
import CoreData

class CoreDataManager: DBService{
    let manager = DataStoreManager()
    
    func saveModel(model: TaskModel){
        let coreDataModel = manager.obtainTaskModel()
        
        coreDataModel.taskId = UUID(uuidString: model.id)
        coreDataModel.name = model.name
        
        manager.saveContext()
    }
    
    func getModels() -> [TaskModel]{
        manager.getModels().map { TaskModel(id: $0.taskId!.uuidString, name: $0.name!) }
    }
    
    func removeModel(model: TaskModel){
        manager.getModel(by: model.id).forEach{
            manager.delete(model: $0)
            manager.saveContext()
        }
        
    }
}
