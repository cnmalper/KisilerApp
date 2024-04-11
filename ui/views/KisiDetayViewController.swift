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
    var viewModel = KisiDetayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi {
            tfKisiAd.text = k.kisi_ad
            tfKisiTel.text = k.kisi_tel
        }
    }

    @IBAction func buttonGuncelle(_ sender: Any) {
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text, let ki = kisi {
            viewModel.guncelle(kisi_id: ki.kisi_id!, kisi_ad: ka, kisi_tel: kt)
        }
    }
}
