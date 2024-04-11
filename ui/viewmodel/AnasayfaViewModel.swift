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
}
