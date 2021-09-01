//
//  CoreDataViewController.swift
//  Task14
//
//  Created by Андрей Фролов on 20.07.2021.
//

import UIKit

class CoreDataViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DBContollerSegue"{
            let controller = segue.destination as! DBViewController
            controller.service = CoreDataManager()
        }
    }
}
