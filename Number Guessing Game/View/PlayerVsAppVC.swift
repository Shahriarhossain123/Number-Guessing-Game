//
//  PlayerVsAppVC.swift
//  Number Guessing Game
//
//  Created by Shishir_Mac on 4/11/21.
//

import UIKit

class PlayerVsAppVC: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var gressButton: UIButton!
    @IBOutlet weak var playerVappTitleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var moveLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var setnumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pVaViewOutlet()
        // Do any additional setup after loading the view.
    }
    
    func pVaViewOutlet() {
        //Button title label
        backButton.titleLabel?.text = Strings.back_button
        
        
        //Button title label color
        backButton.titleLabel?.textColor = .white
        
        //info text
        playerVappTitleLabel.text = Strings.player_vs_app
        playerVappTitleLabel.textColor = Colors.violetColor
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func gressButtonAction(_ sender: UIButton) {
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
