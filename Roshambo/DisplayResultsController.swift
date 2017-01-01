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
  
    func evaluateWinner() {
      if self.playerValue == 0 && self.computerValue == 2 {
        self.youWon = true
        self.imageValue = 2
      } else if self.playerValue == 1 && self.computerValue == 0 {
        self.youWon = true
        self.imageValue = 1
      } else if self.playerValue == 2 && self.computerValue == 1 {
        self.youWon = true
        self.imageValue = 3
      } else if self.computerValue == 0 && self.playerValue == 2 {
        self.youWon = false
        self.imageValue = 2
      } else if self.computerValue == 1 && self.playerValue == 0 {
        self.youWon = false
        self.imageValue = 1
      } else if self.computerValue == 2 && self.playerValue == 1 {
        self.youWon = false
        self.imageValue = 3
      } else {
        self.youWon = false
        self.imageValue = 0
      }
    }
  
    func generateResultsMessage() {
      var resultsMessage = ""
      
      if self.playerValue == 0 && self.computerValue == 2 {
        resultsMessage += "Rock crushes Scissors."
      } else if self.playerValue == 1 && self.computerValue == 0 {
        resultsMessage += "Paper covers Rock."
      } else if self.playerValue == 2 && self.computerValue == 1 {
        resultsMessage += "Scissors cut Paper."
      } else if self.computerValue == 0 && self.playerValue == 2 {
        resultsMessage += "Rock crushes Scissors."
      } else if self.computerValue == 1 && self.playerValue == 0 {
        resultsMessage += "Paper covers Rock."
      } else if self.computerValue == 2 && self.playerValue == 1 {
        resultsMessage += "Scissors cut Paper."
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
  
    func setComputerIcon() {
      if let icon = self.computerValue {
        switch icon {
        case 0:
          self.computerMove.image = UIImage(named: "rock")
        case 1:
          self.computerMove.image = UIImage(named: "paper")
        case 2:
          self.computerMove.image = UIImage(named: "scissors")
        default:
          print("computerValue is not a valid value")
        }
      }
    }
  
    func setPlayerIcon() {
      if let icon = self.playerValue {
        switch icon {
        case 0:
          self.playerMove.image = UIImage(named: "rock")
        case 1:
          self.playerMove.image = UIImage(named: "paper")
        case 2:
          self.playerMove.image = UIImage(named: "scissors")
        default:
          print("playerValue is not a valid value")
        }
      }
    }
  
    func setResultImage() {
      if self.imageValue == 0 {
        self.resultImage.image = UIImage(named: "itsATie")
      } else if self.imageValue == 1 {
        self.resultImage.image = UIImage(named: "PaperCoversRock")
      } else if self.imageValue == 2 {
        self.resultImage.image = UIImage(named: "RockCrushesScissors")
      } else {
        self.resultImage.image = UIImage(named: "ScissorsCutPaper")
      }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(self.playerValue)
//        print(self.computerValue)
        setPlayerIcon()
        setComputerIcon()
        evaluateWinner()
        setResultImage()
        generateResultsMessage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  
//added whitespace
  
    @IBAction func dismiss() {
      self.dismiss(animated: true, completion: nil)
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
