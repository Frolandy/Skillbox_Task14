//
//  TableCell.swift
//  Task14
//
//  Created by Андрей Фролов on 20.07.2021.
//

import UIKit

class TableCell: UITableViewCell{
    @IBOutlet weak var taskLabel: UILabel!
    
    weak var delegate: TableCellDelegate?
    
    @IBAction func removeButtonPressed(_ sender: Any) {
        delegate?.remove(self)
    }
}

protocol TableCellDelegate: AnyObject{
    func remove(_ cell: UITableViewCell)
}
