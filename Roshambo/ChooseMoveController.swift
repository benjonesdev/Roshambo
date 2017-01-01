//
//  ChooseMoveController.swift
//  Roshambo
//
//  Created by Benjamin Jones on 12/31/16.
//  Copyright © 2016 Benjamin Jones. All rights reserved.
//

import UIKit

class ChooseMoveController: UIViewController {
  
  func randomComputerMoveValue() -> Int {
    let randomValue = arc4random() % 3
    
    return Int(randomValue)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let controller = segue.destination as! DisplayResultsController
    if let playerMove = segue.identifier {
      switch playerMove {
      case "RockSegue":
        controller.playerValue = 0
      case "PaperSegue":
        controller.playerValue = 1
      case "ScissorsSegue":
        controller.playerValue = 2
      default:
        print("Invalid playerMove")
      }
    }
    controller.computerValue = randomComputerMoveValue()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

