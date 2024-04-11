//
//  KisiKayitViewModel.swift
//  KisilerApp
//
//  Created by Alper Canımoğlu on 11.04.2024.
//

import Foundation

class KisiKayitViewModel {
    
    var kRepo = KisilerDaoRepository()
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        kRepo.kaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
}
