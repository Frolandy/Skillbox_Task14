//
//  RealmViewController.swift
//  Task14
//
//  Created by Андрей Фролов on 20.07.2021.
//

import UIKit

class RealmViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DBContollerSegue"{
            let controller = segue.destination as! DBViewController
            let service = RealmManager()
            controller.service = service
        }
    }
}
