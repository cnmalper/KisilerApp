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

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonKaydet(_ sender: Any) {
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text {
            kisiKayitViewModel.kaydet(kisi_ad: ka, kisi_tel: kt)
        }
    }
}
