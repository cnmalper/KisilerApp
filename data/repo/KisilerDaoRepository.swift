//
//  KisilerDaoRepository.swift
//  KisilerApp
//
//  Created by Alper Canımoğlu on 11.04.2024. "Dao -> Database Access Object"
//

import Foundation
import RxSwift

class KisilerDaoRepository {
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        print("Kisi kaydedildi -> \(kisi_ad) - \(kisi_tel)")
    }
    
    func guncelle(kisi_id:Int, kisi_ad:String, kisi_tel:String) {
        print("Kisi kaydedildi -> \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    }
    
    func sil(kisi_id: Int) {
        print("Kisi sil: \(kisi_id)")
    }
    
    func araSearchBar(arananKisi: String) {
        print("Kisi araniyor: \(arananKisi)")
    }
    
    func kisileriYukle() {
        var liste = [Kisiler]()
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Ali", kisi_tel: "0000000")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Ahmet", kisi_tel: "111111")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Akin", kisi_tel: "222222")
        let k4 = Kisiler(kisi_id: 4, kisi_ad: "Aynil", kisi_tel: "333333")
        let k5 = Kisiler(kisi_id: 5, kisi_ad: "Arda", kisi_tel: "555555")
        let k6 = Kisiler(kisi_id: 6, kisi_ad: "Fatma", kisi_tel: "6666666")
        let k7 = Kisiler(kisi_id: 7, kisi_ad: "Salih", kisi_tel: "7777777")
        let k8 = Kisiler(kisi_id: 8, kisi_ad: "Mert", kisi_tel: "8888888")

        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        liste.append(k4)
        liste.append(k5)
        liste.append(k6)
        liste.append(k7)
        liste.append(k8)
        kisilerListesi.onNext(liste) // tetiklemek
    }
}
