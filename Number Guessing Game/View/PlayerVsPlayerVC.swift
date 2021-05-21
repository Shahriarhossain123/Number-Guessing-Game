//
//  PlayerVsPlayerVC.swift
//  Number Guessing Game
//
//  Created by Shishir_Mac on 4/11/21.
//

import UIKit

class PlayerVsPlayerVC: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var gressButton: UIButton!
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var playerVplayerTitleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var moveLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var setnumberTextField: UITextField!
    @IBOutlet weak var gressnumberTextfield: UITextField!
    @IBOutlet weak var hintsetView: UIView!
    @IBOutlet weak var equalsImage: UIImageView!
    //@IBOutlet weak var pVSpTableView: UITableView!
    
    // MARK: - Var
    var moves = 10
    var tablecellCount = 0
    var tablecellCountarr:[Int] = [Int]()
    var appanswer = Int.random(in: 1...100)
    var playeranswer:[Int] = [Int]()
    var win = Bool()
    var hintTableLabelTitle:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pVpViewOutlet()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Function
    //This function use of some view outlet content
    func pVpViewOutlet() {
        //pVSappTableView.reloadData()
        //Button title label
        backButton.titleLabel?.text = Strings.back_button
        
        
        //Button title label color
        backButton.titleLabel?.textColor = .white
        gressButton.titleLabel?.textColor = .white
        playerVplayerTitleLabel.textColor = Colors.violetColor
        infoLabel.textColor = Colors.violetColor
        moveLabel.textColor = Colors.violetColor
        hintLabel.textColor = Colors.violetColor
        //setnumberTextField.textColor = Colors.violetColor
        hintsetView.layer.backgroundColor = UIColor.white.cgColor
        
        //info text
        tablecellCount = 0
        moves = 10
        playeranswer = []
        tablecellCountarr = []
        //setnumberTextField.text = ""
        playerVplayerTitleLabel.text = Strings.player_vs_player
        infoLabel.text = Strings.player_vs_player_title_set
        moveLabel.text = "\(moves) " + Strings.more_move
        hintLabel.text = "HINT:\n" + Strings.lets_guess
    }
    
    func emptyText(){
        let alert = UIAlertController(title: Strings.numbers, message: Strings.text_is_empty, preferredStyle: UIAlertController.Style.alert)
        
        let cancel = UIAlertAction(title: Strings.okey_button, style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func winAlert(res: Bool){
        if res == true {
            let alert = UIAlertController(title: Strings.congratulation, message: Strings.won, preferredStyle: UIAlertController.Style.alert)
            
            let cancel = UIAlertAction(title: Strings.okey_button, style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancel)
            let quit = UIAlertAction(title: Strings.restart_button, style: UIAlertAction.Style.destructive, handler: { [self] action in
                pVpViewOutlet()
            })
            alert.addAction(quit)
            
            self.present(alert, animated: true, completion: nil)
        } else if moves == 0 {
            let alert = UIAlertController(title: Strings.bad_guess, message: Strings.lose, preferredStyle: UIAlertController.Style.alert)
            
            let cancel = UIAlertAction(title: Strings.okey_button, style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancel)
            let quit = UIAlertAction(title: Strings.restart_button, style: UIAlertAction.Style.destructive, handler: { [self] action in
                pVpViewOutlet()
            })
            alert.addAction(quit)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func helpAlert() {
        let alert = UIAlertController(title: Strings.player_vs_player, message: Strings.player_vs_player_help, preferredStyle: UIAlertController.Style.alert)
        
        let cancel = UIAlertAction(title: Strings.okey_button, style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func backAlert() {
        let alert = UIAlertController(title: Strings.player_vs_player, message: Strings.donot_continue, preferredStyle: UIAlertController.Style.alert)
        
        let cancel = UIAlertAction(title: Strings.cancel_button, style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancel)
        let quit = UIAlertAction(title: Strings.okey_button, style: UIAlertAction.Style.destructive, handler: { [self] action in
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(quit)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Button
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        backAlert()
    }
    
    @IBAction func helpButtonAction(_ sender: UIButton) {
        helpAlert()
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
