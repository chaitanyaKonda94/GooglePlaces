//
//  LanguageSelectionViewController.swift
//  GooglePlacesDemo
//
//  Created by SMSCountry Networks Pvt. Ltd on 08/10/18.
//  Copyright © 2018 SMSCountry Network Pvt.Ltd. All rights reserved.
//

import UIKit

class LanguageSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func englishAction(_ sender : UIButton){
        L102Language.setAppleLAnguageTo(lang: "en")
     //   UserDefaultStore.deviceFullLanguage = "english"
        
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
     //   UserDefaultStore.selectedLanguage = "0"
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let appdelegateObj = Constatns.Appdelegate
        var navigationcontorObj = UINavigationController()
        let aboutvc  = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationcontorObj = UINavigationController.init(rootViewController: aboutvc)
        navigationcontorObj.isNavigationBarHidden = true
        appdelegateObj?.window?.rootViewController =  navigationcontorObj
        
    }
    @IBAction func arabicAction(_ sender : UIButton){
        L102Language.setAppleLAnguageTo(lang: "ar")
      //  UserDefaultStore.deviceFullLanguage = "arabic"
    
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
      //  UserDefaultStore.selectedLanguage = "1"
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let appdelegateObj = Constatns.Appdelegate
        let aboutvc  = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        var navigationcontorObj = UINavigationController()
        navigationcontorObj = UINavigationController.init(rootViewController: aboutvc)
        navigationcontorObj.isNavigationBarHidden = true
        appdelegateObj?.window?.rootViewController =  navigationcontorObj
    }

}



