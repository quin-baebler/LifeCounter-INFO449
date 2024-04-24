//
//  ViewController.swift
//  LifeCounter
//
//  Created by Quinton Baebler on 4/22/24.
//

import UIKit

struct Player {
    let name: String
    var life: Int
}

class ViewController: UIViewController, UITableViewDelegate, MyPlayerCellTableViewCell.LifeCellDelegate {
    
    private var history: [String] = []
    @IBOutlet weak var playerCount: UIStepper!
    private var players: [Player] = []
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        players = [
            Player(name: "Player 1", life: 20),
            Player(name: "Player 2", life: 20),
            Player(name: "Player 3", life: 20),
            Player(name: "Player 4", life: 20),
        ]
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MyPlayerCellTableViewCell", bundle: nil), forCellReuseIdentifier: "MyPlayerCellTableViewCell")
        
        playerCount.maximumValue = 8
        playerCount.minimumValue = 2
        playerCount.value = Double(players.count)
        playerCount.stepValue = 1
        playerCount.isEnabled = true
        
        
    }
    
    
    @IBAction func playerCountChanged(_ sender: UIStepper) {
        let newPlayerCount = Int(sender.value)
       // print(newPlayerCount)
       // print(players.count)
        if newPlayerCount > players.count && players.count < 8 {
            players.append(Player(name: "Player \(newPlayerCount)", life: 20)) // Add single player
        } else if newPlayerCount < players.count {
            players.removeSubrange(newPlayerCount..<players.count)
        }
            
        tableView.reloadData() // Reload table view data
       /// print(players)
    }
    
    @IBAction func resetGame(){
        players.removeAll() // Remove all players
          players.append(contentsOf: [
            Player(name: "Player 1", life: 20),
            Player(name: "Player 2", life: 20),
            Player(name: "Player 3", life: 20),
            Player(name: "Player 4", life: 20),
          ])
          playerCount.value = Double(players.count) // Update stepper value
          playerCount.isEnabled = true
          // Update table view
          tableView.reloadData()
    }
    
    func lifeUpdated(_ cell: MyPlayerCellTableViewCell) {
        playerCount.isEnabled = false // Disable stepper on life update
    }
}
    extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return players.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlayerCellTableViewCell", for: indexPath) as? MyPlayerCellTableViewCell else {
                fatalError("Could not dequeue cell with identifier PlayerCell")
            }
            cell.delegate = self
            cell.selectionStyle = .none
            
            let player = players[indexPath.row]
            
            cell.nameLabel.text = player.name
            cell.lifeLabel.text = String(player.life)
            
            
            return cell
        }
    }

