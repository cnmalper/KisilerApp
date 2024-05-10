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
    
    let db: FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        
        db?.open() // baglantiyi ac
        
        do {
            try db!.executeUpdate("INSERT INTO kisiler (kisi_ad, kisi_tel) VALUES (?,?)", values: [kisi_ad, kisi_tel])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close() // baglantiyi kapat
    }
    
    func guncelle(kisi_id:Int, kisi_ad:String, kisi_tel:String) {
        
        db?.open() // baglantiyi ac
        
        do {
            try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ?, kisi_tel = ? WHERE kisi_id = ?", values: [kisi_ad, kisi_tel, kisi_id])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close() // baglantiyi kapat
    }
    
    func sil(kisi_id:Int) {
        
        db?.open() // baglantiyi ac
        
        do {
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [kisi_id])
            kisileriYukle() // database'den silindikten sonra, arayüzün reload edilmesi gerekir.
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close() // baglantiyi kapat
    }
    
    func araSearchBar(arananKisi: String) {
        
        db?.open() // baglantiyi ac
        var liste = [Kisiler]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like '%\(arananKisi)%'", values: nil)
            
            while rs.next() {
                let kisi = Kisiler.init(kisi_id: Int(rs.string(forColumn: "kisi_id"))!, kisi_ad: rs.string(forColumn: "kisi_ad")!, kisi_tel: rs.string(forColumn: "kisi_tel")!)
                liste.append(kisi)
            }
            
            kisilerListesi.onNext(liste) // tetiklemek
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close() // baglantiyi kapat
    }
    
    func kisileriYukle() {
        
        db?.open() // baglantiyi ac
        var liste = [Kisiler]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while rs.next() {
                let kisi = Kisiler.init(kisi_id: Int(rs.string(forColumn: "kisi_id"))!, kisi_ad: rs.string(forColumn: "kisi_ad")!, kisi_tel: rs.string(forColumn: "kisi_tel")!)
                liste.append(kisi)
            }
            
            kisilerListesi.onNext(liste) // tetiklemek
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close() // baglantiyi kapat
    }
}
