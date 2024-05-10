//
//  AnasayfaViewModel.swift
//  KisilerApp
//
//  Created by Alper Canımoğlu on 11.04.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    
    var kRepo = KisilerDaoRepository()
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    init() {
        veriTabaniKopyala()
        kisilerListesi = kRepo.kisilerListesi
        kisileriYukle()
    }
    
    func sil(kisi_id: Int) {
        kRepo.sil(kisi_id: kisi_id)
        kisileriYukle() // silme isleminden sonra kalan verileri yuklemesi gerekecek.
    }
    
    func araSearchBar(arananKisi: String) {
        kRepo.araSearchBar(arananKisi: arananKisi)
    }
    
    func kisileriYukle() {
        kRepo.kisileriYukle()
    }
    
    func veriTabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabani zaten var.")
        } else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch {}
        }
        
    }
}
