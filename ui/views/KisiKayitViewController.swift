//
//  KisiKayitViewController.swift
//  KisilerApp
//
//  Created by Alper Canımoğlu on 31.03.2024.
//

import UIKit

class KisiKayitViewController: UIViewController {

    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    var kisiKayitViewModel = KisiKayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        darkModeAlwaysOn()
        createGestureRecognizerForKeyboard()
    }
    
    func createGestureRecognizerForKeyboard() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func darkModeAlwaysOn() {
        overrideUserInterfaceStyle = .dark
    }

    @IBAction func buttonKaydet(_ sender: Any) {
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text {
            if ka != "" && kt != "" {
                kisiKayitViewModel.kaydet(kisi_ad: ka, kisi_tel: kt)
                self.navigationController?.popViewController(animated: true)
            } else {
                Common.showAlert(errorTitle: "Missing data!", errorMessage: "Please type all of the data you want to save.", vc: self)
            }
        }
    }
}
