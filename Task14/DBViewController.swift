//
//  DBViewController.swift
//  Task14
//
//  Created by Андрей Фролов on 20.07.2021.
//

import UIKit

class DBViewController: UIViewController{
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskTableView: UITableView!
    
    private var models: [TaskModel] = []
    
    var service: DBService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTableView.delegate = self
        taskTableView.dataSource = self
        
        taskTableView.delaysContentTouches = false
        

        service?.getModels().forEach({ models.append($0) })
        
        taskTableView.reloadData()
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        if let name = taskNameTextField.text{
            let model = TaskModel(id: UUID().uuidString, name: name)
            models.append(model)
            service?.saveModel(model: model)
            taskTableView.reloadData()
        }
    }
}

extension DBViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
        
        cell.delegate = self
        cell.taskLabel.text = models[indexPath.row].name
        
        return cell
    }
}

extension DBViewController: TableCellDelegate{
    func remove(_ cell: UITableViewCell) {
        if let path = taskTableView.indexPath(for: cell){
            let model = models.remove(at: path.row)
            service?.removeModel(model: model)
            taskTableView.reloadData()
        }
    }
}
