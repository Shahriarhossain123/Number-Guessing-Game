//
//  InfoVC.swift
//  Number Guessing Game
//
//  Created by Shishir_Mac on 4/9/21.
//

import UIKit

class InfoVC: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var infoTitleLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoViewOutletDesign()
        // Do any additional setup after loading the view.
    }
    
    func infoViewOutletDesign(){
        //Button title label
        backButton.titleLabel?.text = Strings.back_button
        
        
        //Button title label color
        backButton.titleLabel?.textColor = .white
        
        //info text
        infoTitleLabel.text = Strings.info
        infoTitleLabel.textColor = Colors.violetColor
        
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true)
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
