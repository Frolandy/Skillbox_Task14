//
//  UserDefaultsViewController.swift
//  Task14
//
//  Created by Андрей Фролов on 20.07.2021.
//

import UIKit

class UserDefaultsViewController: UIViewController{
    
    enum DefaultsIds: String{
        case surname = "SurnameTextField"
        case name = "NameTextField"
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = getFromDefaults(key: .name)
        surnameTextField.text = getFromDefaults(key: .surname)
    }
    
    private func setToDefaults(_ value: String, key: DefaultsIds){
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    private func getFromDefaults(key: DefaultsIds) -> String?{
        return UserDefaults.standard.string(forKey: key.rawValue)
    }
    
    @IBAction func nameEndEditing(_ sender: UITextField) {
        setToDefaults(sender.text ?? "", key: .name)
    }
    @IBAction func surnameEndEditing(_ sender: UITextField) {
        setToDefaults(sender.text ?? "", key: .surname)
    }
}
