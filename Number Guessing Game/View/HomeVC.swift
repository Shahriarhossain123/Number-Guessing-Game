//
//  HomeVC.swift
//  Number Guessing Game
//
//  Created by Shishir_Mac on 4/7/21.
//

import UIKit


class HomeVC: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var quitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewOutletDesign()
        // Do any additional setup after loading the view.
    }
    
    func ViewOutletDesign(){
        //Button title label
        playButton.titleLabel?.text = Strings.play_button
        infoButton.titleLabel?.text = Strings.info_button
        quitButton.titleLabel?.text = Strings.quit_button
        
        //Button title label color
        playButton.titleLabel?.textColor = .white
        infoButton.titleLabel?.textColor = .white
        quitButton.titleLabel?.textColor = .white
    }
    
    @IBAction func playButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let levelVC = storyboard.instantiateViewController(withIdentifier: "LevelVC") as! LevelVC
        levelVC.modalPresentationStyle = .fullScreen
        present(levelVC, animated: true, completion: nil)
    }
    
    @IBAction func infoButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let infoVC = storyboard.instantiateViewController(withIdentifier: "InfoVC") as! InfoVC
        infoVC.modalPresentationStyle = .fullScreen
        present(infoVC, animated: true, completion: nil)
        
    }
    
    @IBAction func quitButtonAction(_ sender: UIButton) {
        // create the alert
        let alert = UIAlertController(title: Strings.quit_button, message: Strings.quit_alert_massage, preferredStyle: UIAlertController.Style.alert)
        // add the actions (buttons)
        let cancel = UIAlertAction(title: Strings.cancel_button, style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancel)
        let quit = UIAlertAction(title: Strings.quit_button, style: UIAlertAction.Style.destructive, handler: { action in
            exit(0)
        })
        alert.addAction(quit)
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
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
