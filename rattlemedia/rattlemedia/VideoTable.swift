//
//  VideoTable.swift
//  rattlemedia
//
//  Created by Max Bilbow on 28/08/2015.
//  Copyright © 2015 Rattle Media Ltd. All rights reserved.
//

import Foundation
import UIKit

class VideoTable : UITableViewController {
    let library: [(name: String,type: String)] = [
     ("Rattle","m4v")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        for cell in self.tableView.visibleCells {
            let label = UILabel()
            label.text = library[0].name
            cell.addSubview(label)

        }
        
    }
}