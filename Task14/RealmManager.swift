//
//  RealmManager.swift
//  Task14
//
//  Created by Андрей Фролов on 20.07.2021.
//

import RealmSwift

class RealmManager: DBService{
    private let realm = try! Realm()
    
    func saveModel(model: TaskModel){
        if let obj = realm.object(ofType: RealmTaskModel.self, forPrimaryKey: model.id){
            obj.name = model.name
        }else{
            try! realm.write{
                realm.create(RealmTaskModel.self, value: RealmTaskModel.fromViewModel(model: model))
            }
        }
    }
    
    func getModels() -> [TaskModel]{
        realm.objects(RealmTaskModel.self).map({TaskModel.fromRealmModel(realmModel: $0)})
    }
    
    func removeModel(model: TaskModel){
        if let obj = realm.object(ofType: RealmTaskModel.self, forPrimaryKey: model.id){
            try! realm.write{
                realm.delete(obj)
            }
        }
        
    }
}

class RealmTaskModel: Object{
    @objc dynamic var taskId = UUID().uuidString
    @objc dynamic var name = ""
    
    static func fromViewModel(model: TaskModel) -> RealmTaskModel{
        let realmModel = RealmTaskModel()
        realmModel.taskId = model.id
        realmModel.name = model.name
        return realmModel
    }
    
    override static func primaryKey() -> String? {
      return "taskId"
    }
}
