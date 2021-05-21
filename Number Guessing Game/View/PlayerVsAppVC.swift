//
//  PlayerVsAppVC.swift
//  Number Guessing Game
//
//  Created by Shishir_Mac on 4/11/21.
//

import UIKit
import Foundation

class PlayerVsAppVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlet
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var gressButton: UIButton!
    @IBOutlet weak var playerVappTitleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var moveLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var setnumberTextField: UITextField!
    @IBOutlet weak var hintsetView: UIView!
    @IBOutlet weak var pVSappTableView: UITableView!
    
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
        pVaViewOutlet()
        pVSappTableView.register(UINib(nibName: "HintTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "HintTitleTableViewCell")
        pVSappTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        pVSappTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        pVSappTableView.reloadData()
    }
    
    // MARK: - Function
    //This function use of some view outlet content
    func pVaViewOutlet() {
        pVSappTableView.reloadData()
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
        hintsetView.layer.backgroundColor = UIColor.white.cgColor
        
        //info text
        tablecellCount = 0
        moves = 10
        playeranswer = []
        tablecellCountarr = []
        setnumberTextField.text = ""
        playerVappTitleLabel.text = Strings.player_vs_app
        infoLabel.text = Strings.player_vs_app_title
        moveLabel.text = "\(moves) " + Strings.more_move
        hintLabel.text = "HINT:\n" + Strings.lets_guess
    }
    
    func mathAnswer(getplayer: Int, setApp: Int) -> Bool {
        var conWin = Bool()
        if (moves > 0){
            var takeEx = 0
            moves -= 1
            if (getplayer < setApp) {
                takeEx = setApp - getplayer
                if (takeEx < 10) {
                    moveLabel.text = "\(moves) " + Strings.more_move
                    hintLabel.text = "HINT:\n" + Strings.low_number
                    hintTableLabelTitle.append(Strings.low_number)
                } else {
                    moveLabel.text = "\(moves) " + Strings.more_move
                    hintLabel.text = "HINT:\n" + Strings.too_low_number
                    hintTableLabelTitle.append(Strings.too_low_number)
                }
            } else if (getplayer > setApp){
                takeEx = getplayer - setApp
                if (takeEx < 10) {
                    moveLabel.text = "\(moves) " + Strings.more_move
                    hintLabel.text = "HINT:\n" + Strings.high_number
                    hintTableLabelTitle.append(Strings.high_number)
                } else {
                    moveLabel.text = "\(moves) " + Strings.more_move
                    hintLabel.text = "HINT:\n" + Strings.too_high_number
                    hintTableLabelTitle.append(Strings.too_high_number)
                }
            } else if (getplayer == setApp){
                moveLabel.text = "\(moves) " + Strings.more_move
                hintLabel.text = "HINT:\n" + Strings.congratulation + ". " + Strings.get_the_number
                conWin = true
            }
        } else{
            conWin = false
        }
        tablecellCount += 1
        tablecellCountarr.append(tablecellCount)
        return conWin
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
                pVaViewOutlet()
            })
            alert.addAction(quit)
            
            self.present(alert, animated: true, completion: nil)
        } else if moves == 0 {
            let alert = UIAlertController(title: Strings.bad_guess, message: Strings.lose, preferredStyle: UIAlertController.Style.alert)
            
            let cancel = UIAlertAction(title: Strings.okey_button, style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancel)
            let quit = UIAlertAction(title: Strings.restart_button, style: UIAlertAction.Style.destructive, handler: { [self] action in
                pVaViewOutlet()
            })
            alert.addAction(quit)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func helpAlert() {
        let alert = UIAlertController(title: Strings.player_vs_app, message: Strings.player_vs_app_help, preferredStyle: UIAlertController.Style.alert)
        
        let cancel = UIAlertAction(title: Strings.okey_button, style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func backAlert() {
        let alert = UIAlertController(title: Strings.player_vs_app, message: Strings.donot_continue, preferredStyle: UIAlertController.Style.alert)
        
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
    
    @IBAction func gressButtonAction(_ sender: UIButton) {
        if (setnumberTextField.text != "") {
            playeranswer.append(Int(setnumberTextField.text!)!)
            win = mathAnswer(getplayer: playeranswer[tablecellCount], setApp: appanswer)
            winAlert(res: win)
        } else{
            emptyText()
        }
        pVSappTableView.reloadData()
    }
    
    @IBAction func helpButtonAction(_ sender: UIButton) {
        helpAlert()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hintTableLabelTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:HintTitleTableViewCell = pVSappTableView.dequeueReusableCell(withIdentifier: "HintTitleTableViewCell", for: indexPath) as! HintTitleTableViewCell
        cell.hinttitleLabel.text = "\(tablecellCountarr[indexPath.row])\t\t" + hintTableLabelTitle[indexPath.row] + "\t\t" + "\(playeranswer[indexPath.row])"
        return cell
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


