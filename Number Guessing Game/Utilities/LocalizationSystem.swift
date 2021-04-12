//
//  LocalizationSystem.swift
//  Number Guessing Game
//
//  Created by Shishir_Mac on 4/10/21.
//

import Foundation

import Foundation
import UIKit

class LocalizationSystem:NSObject {
    
    var bundle: Bundle!
    
    class var shared: LocalizationSystem {
        struct Singleton {
            static let instance: LocalizationSystem = LocalizationSystem()
        }
        return Singleton.instance
    }
    
    override init() {
        super.init()
        bundle = Bundle.main
    }
    
    func localizedStringForKey(key:String, comment:String) -> String {
        return bundle.localizedString(forKey: key, value: comment, table: nil)
    }
    
    func localizedImagePathForImg(imagename:String, type:String) -> String {
        guard let imagePath =  bundle.path(forResource: imagename, ofType: type) else {
            return ""
        }
        return imagePath
    }
    
    //MARK:- setLanguage
    // Sets the desired language of the ones you have.
    // If this function is not called it will use the default OS language.
    // If the language does not exists y returns the default OS language.
    func setLanguage(languageCode:String) {
        var appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as! [String]
        appleLanguages.remove(at: 0)
        appleLanguages.insert(languageCode, at: 0)
        UserDefaults.standard.set(appleLanguages, forKey: "AppleLanguages")
        UserDefaults.standard.synchronize() //needs restrat
        
        if let languageDirectoryPath = Bundle.main.path(forResource: languageCode, ofType: "lproj")  {
            bundle = Bundle.init(path: languageDirectoryPath)
        } else {
            resetLocalization()
        }
    }
    
    //MARK:- resetLocalization
    //Resets the localization system, so it uses the OS default language.
    func resetLocalization() {
        bundle = Bundle.main
    }
    
    //MARK:- getLanguage
    // Just gets the current setted up language.
    func getLanguage() -> String {
        guard let appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String] else{
            return "en"
        }
        let prefferedLanguage = appleLanguages[0]
        if prefferedLanguage.contains("-") {
            let array = prefferedLanguage.components(separatedBy: "-")
            return array[0]
        }
        return prefferedLanguage
    }
    
}



extension String {
    
    func localized(lang:String) -> String {
        
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")//.mainBundle().pathForResource(lang, ofType: “lproj")
        
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
    
    func localizedValue() -> String {
        
        let path = Bundle.main.path(forResource: LocalizationSystem.shared.getLanguage(), ofType: "lproj")//.mainBundle().pathForResource(lang, ofType: “lproj")
        
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}



//
//  LocalizeLanguage.swift
//  Pathao
//
//  Created by Md. Kamrul Hasan on 2/5/17.
//  Copyright © 2017 Shifat Adnan. All rights reserved.
//

import Foundation

//language
let APP_LANGUAGE_KEY    = "APP_LANGUAGE_KEY"
let LANGUAGE_ENGLISH    = "en"
let LANGUAGE_ARABIC    = "it"

//let LANGUAGE_CHANGE_NOTIFICATION = Notification.Name("LANGUAGE_CHANGE_NOTIFICATION")

// introduction
let title_1      = "title_1"


