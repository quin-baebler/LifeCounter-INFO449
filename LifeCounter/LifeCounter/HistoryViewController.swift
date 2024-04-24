//
//  HistoryViewController.swift
//  LifeCounter
//
//  Created by Quinton Baebler on 4/23/24.
//

import UIKit
class HistoryTableCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
}

class HistoryViewController: UIViewController, UITableViewDelegate  {
    
    private var history: [String] = []
    @IBOutlet private var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MyPlayerCellTableViewCell", bundle: nil), forCellReuseIdentifier: "MyPlayerCellTableViewCell")
        
    }
    
}
    
    extension HistoryViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return history.count
        }
    

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableCell", for: indexPath) as? HistoryTableCell else {
                fatalError("Could not dequeue cell with identifier PlayerCell")
            }
           
            return cell
        }
    }

