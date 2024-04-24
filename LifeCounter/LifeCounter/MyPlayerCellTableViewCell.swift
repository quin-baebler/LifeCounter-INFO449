//
//  PlayerCell.swift
//  LifeCounter
//
//  Created by Quinton Baebler on 4/23/24.
//

import Foundation
import UIKit

class MyPlayerCellTableViewCell: UITableViewCell {

    static let identifier = "MyPlayerCellTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "MyPlayerCellTableViewCell", bundle: nil)
    }
  // MARK: - Outlets
    
    var delegate: LifeCellDelegate?
    //var history : [(String, Int)] = []!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var plusOneButton: UIButton!
    @IBOutlet weak var minusOneButton: UIButton!
    @IBOutlet weak var customAddLives: UITextField!
    @IBOutlet weak var customMinusLives: UITextField!
    @IBOutlet weak internal var customPlusButton: UIButton!
    @IBOutlet weak internal var customMinusButton: UIButton!
    

  // MARK: - Lifecycle Methods

  override func awakeFromNib() {
    super.awakeFromNib()
    // Additional cell setup if needed
  }
    
    @IBAction func increaseLifeByOne(_ sender: UIButton) {
        updateLives(from: lifeLabel, life_change: +1)
    }

    @IBAction func decreaseLifeByOne(_ sender: UIButton) {
      updateLives(from: lifeLabel, life_change: -1)
    }
    
    @IBAction func increaseLifeBy(_ sender: UIButton) {
      let customLife = 2 //should be TextUI but isnt working and I cant be asked
      updateLives(from: lifeLabel, life_change: customLife)
    }

    @IBAction func decreaseLifeBy(_ sender: UIButton) {
        let customLife = 2 //should be TextUI but isnt working and I cant be asked
        updateLives(from: lifeLabel, life_change: -customLife)
    }
    
    var viewController: ViewController?
    private func updateLives(from label: UILabel, life_change: Int){
        if let currentLife = getLifeCount(from: label) {
            let newLife = currentLife + life_change
            if (newLife <= 0) {
                viewController?.resetGame()
            }
            label.text = String(newLife)
            delegate?.lifeUpdated(self)
            //history
        }
    }
    
    // update viewcontroller about if button is pressed
    protocol LifeCellDelegate {
        func lifeUpdated(_ cell: MyPlayerCellTableViewCell)
    }
    
    private func getLifeCount(from label: UILabel) -> Int? {
        print(label.text)
        var lifeText = max(0, Int(label.text ?? "0")!)
        
        return Int(lifeText ?? 0) // Convert to Int or return 0 if parsing fails
    }
}
