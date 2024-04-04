//
//  KisiDetayViewController.swift
//  KisilerApp
//
//  Created by Alper Canımoğlu on 31.03.2024.
//

import UIKit

class KisiDetayViewController: UIViewController {

    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    var kisi: Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi {
            tfKisiAd.text = k.kisi_ad
            tfKisiTel.text = k.kisi_tel
        }
    }

    @IBAction func buttonGuncelle(_ sender: Any) {
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text, let ki = kisi {
            guncelle(kisi_id: ki.kisi_id!, kisi_ad: ka, kisi_tel: kt)
        }
    }
    
    func guncelle(kisi_id:Int, kisi_ad:String, kisi_tel:String) {
        print("Kisi kaydedildi -> \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    }
}
