//
//  DisplayResultsController.swift
//  Roshambo
//
//  Created by Benjamin Jones on 12/31/16.
//  Copyright © 2016 Benjamin Jones. All rights reserved.
//

import UIKit

class DisplayResultsController: UIViewController {
  
    // Mark Properties
    // playerValue, computerValue: 0 = Rock, 1 = Paper, 2 = Scissors
    var playerValue: Int?
    var computerValue: Int?
    // imageValue: 0 = itsATie, 1 = paperCoversRock, 2 = rockCrushesScissors, 3 =  scissorsCutPaper
    var imageValue: Int?
    var youWon: Bool?
    var winningMessage: String?
  
    // Mark Outlets
    @IBOutlet var playerMove: UIImageView!
    @IBOutlet var computerMove: UIImageView!
    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var text: UILabel!
  
  func evaluateWinner() -> Int {
    if self.playerValue == 0 && self.computerValue == 2 {
      self.youWon = true
      return 2
    } else if self.playerValue == 1 && self.computerValue == 0 {
      self.youWon = true
      return 1
    } else if self.playerValue == 2 && self.computerValue == 1 {
      self.youWon = true
      return 3
    } else if self.computerValue == 0 && self.playerValue == 2 {
      self.youWon = false
      return 2
    } else if self.computerValue == 1 && self.playerValue == 0 {
      self.youWon = false
      return 1
    } else if self.computerValue == 2 && self.playerValue == 1 {
      self.youWon = false
      return 3
    } else {
      self.youWon = false
      return 0
    }
  }
  
  func generateResultsMessage() {
    var resultsMessage = ""
    
    if self.playerValue == 0 && self.computerValue == 2 {
      resultsMessage += "Scissors cut Paper."
    } else if self.playerValue == 1 && self.computerValue == 0 {
      resultsMessage += "Paper covers Rock."
    } else if self.playerValue == 2 && self.computerValue == 1 {
      resultsMessage += "Rock crushes Scissors."
    } else if self.computerValue == 0 && self.playerValue == 2 {
      resultsMessage += "Scissors cut Paper."
    } else if self.computerValue == 1 && self.playerValue == 0 {
      resultsMessage += "Paper covers Rock."
    } else if self.computerValue == 2 && self.playerValue == 1 {
      resultsMessage += "Rock crushes Scissors."
    } else {
      resultsMessage += "It's a tie."
      self.text.text = resultsMessage
      return
    }
    
    if self.youWon == true {
      resultsMessage += " You won!"
    } else {
      resultsMessage += " You lost."
    }
    self.text.text = resultsMessage
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
