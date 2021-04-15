//
//  PlayerVsAppVC.swift
//  Number Guessing Game
//
//  Created by Shishir_Mac on 4/11/21.
//

import UIKit
import Foundation

class PlayerVsAppVC: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var gressButton: UIButton!
    @IBOutlet weak var playerVappTitleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var moveLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var setnumberTextField: UITextField!
    
    var moves = 10
    var appanswer = Int.random(in: 1...100)
    var playeranswer = 0
    var win = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pVaViewOutlet()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Function
    func pVaViewOutlet() {
        //Button title label
        backButton.titleLabel?.text = Strings.back_button
        
        //Button title label color
        backButton.titleLabel?.textColor = .white
        gressButton.titleLabel?.textColor = .white
        playerVappTitleLabel.textColor = Colors.violetColor
        infoLabel.textColor = Colors.violetColor
        moveLabel.textColor = Colors.violetColor
        hintLabel.textColor = Colors.violetColor
        setnumberTextField.textColor = Colors.violetColor
        
        //info text
        playerVappTitleLabel.text = Strings.player_vs_app
        infoLabel.text = Strings.player_vs_app_title
        moveLabel.text = "\(moves) " + Strings.more_move
        hintLabel.text = "HINT:\n" + Strings.lets_guess
    }
    
    func mathAnswer(getplayer: Int, setApp: Int) -> Bool {
        var conWin = false
        if (moves > 0){
            var takeEx = 0
            moves -= 1
            if (getplayer < setApp) {
                takeEx = setApp - getplayer
                if (takeEx < 10) {
                    moveLabel.text = "\(moves) " + Strings.more_move
                    hintLabel.text = "HINT:\n" + Strings.low_number
                } else {
                    moveLabel.text = "\(moves) " + Strings.more_move
                    hintLabel.text = "HINT:\n" + Strings.too_low_number
                }
            } else if (getplayer > setApp){
                takeEx = getplayer - setApp
                if (takeEx < 10) {
                    moveLabel.text = "\(moves) " + Strings.more_move
                    hintLabel.text = "HINT:\n" + Strings.high_number
                } else {
                    moveLabel.text = "\(moves) " + Strings.more_move
                    hintLabel.text = "HINT:\n" + Strings.too_high_number
                }
            } else if (getplayer == setApp){
                moveLabel.text = "\(moves) " + Strings.more_move
                hintLabel.text = "HINT:\n" + Strings.congratulation + ". " + Strings.get_the_number
                conWin = true
            }
        } else{
            conWin = false
        }
        return conWin
    }
    
    func emptyText(){
        // create the alert
        let alert = UIAlertController(title: Strings.numbers, message: Strings.text_is_empty, preferredStyle: UIAlertController.Style.alert)
        // add the actions (buttons)
        let cancel = UIAlertAction(title: Strings.okey_button, style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancel)
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func winAlert(res: Bool){
        if res == true {
            // create the alert
            let alert = UIAlertController(title: Strings.congratulation, message: Strings.won, preferredStyle: UIAlertController.Style.alert)
            // add the actions (buttons)
            let cancel = UIAlertAction(title: Strings.okey_button, style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancel)
            let quit = UIAlertAction(title: Strings.restart_button, style: UIAlertAction.Style.destructive, handler: { [self] action in
                pVaViewOutlet()
            })
            alert.addAction(quit)
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        } else {
            // create the alert
            let alert = UIAlertController(title: Strings.bad_guess, message: Strings.lose, preferredStyle: UIAlertController.Style.alert)
            // add the actions (buttons)
            let cancel = UIAlertAction(title: Strings.okey_button, style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancel)
            let quit = UIAlertAction(title: Strings.restart_button, style: UIAlertAction.Style.destructive, handler: { [self] action in
                pVaViewOutlet()
            })
            alert.addAction(quit)
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    // MARK: - Button
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func gressButtonAction(_ sender: UIButton) {
        if (setnumberTextField.text != "") {
            playeranswer = Int(setnumberTextField.text!)!
            win = mathAnswer(getplayer: playeranswer, setApp: appanswer)
        } else{
            emptyText()
        }
        
    }
    
    @IBAction func helpButtonAction(_ sender: UIButton) {
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
