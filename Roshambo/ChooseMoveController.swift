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
    let randomValue = 1 + arc4random() % 3
    
    return Int(randomValue)
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

