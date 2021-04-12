//
//  LevelVC.swift
//  Number Guessing Game
//
//  Created by Shishir_Mac on 4/9/21.
//

import UIKit

class LevelVC: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playerVplayerButton: UIButton!
    @IBOutlet weak var playerVappButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelViewOutletDesign()
        // Do any additional setup after loading the view.
    }
    func levelViewOutletDesign(){
        //Button title label
        backButton.titleLabel?.text = Strings.back_button
        playerVplayerButton.titleLabel?.text = Strings.player_vs_player
        playerVappButton.titleLabel?.text = Strings.player_vs_app
        
        //Button title label color
        backButton.titleLabel?.textColor = .white
        playerVplayerButton.titleLabel?.textColor = .white
        playerVappButton.titleLabel?.textColor = .white
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func playerVplayerButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let playerVsPlayerVC = storyboard.instantiateViewController(withIdentifier: "PlayerVsPlayerVC") as! PlayerVsPlayerVC
        playerVsPlayerVC.modalPresentationStyle = .fullScreen
        present(playerVsPlayerVC, animated: true, completion: nil)
    }
    
    @IBAction func playerVappButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let playerVsAppVC = storyboard.instantiateViewController(withIdentifier: "PlayerVsAppVC") as! PlayerVsAppVC
        playerVsAppVC.modalPresentationStyle = .fullScreen
        present(playerVsAppVC, animated: true, completion: nil)
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
