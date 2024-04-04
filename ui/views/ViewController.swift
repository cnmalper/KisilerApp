//
//  ViewController.swift
//  KisilerApp
//
//  Created by Alper Canımoğlu on 31.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    var kisilerListesi = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Ali", kisi_tel: "0000000")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Ahmet", kisi_tel: "111111")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Akin", kisi_tel: "222222")
        let k4 = Kisiler(kisi_id: 4, kisi_ad: "Aynil", kisi_tel: "333333")
        let k5 = Kisiler(kisi_id: 5, kisi_ad: "Arda", kisi_tel: "555555")
        let k6 = Kisiler(kisi_id: 6, kisi_ad: "Fatma", kisi_tel: "6666666")
        let k7 = Kisiler(kisi_id: 7, kisi_ad: "Salih", kisi_tel: "7777777")
        let k8 = Kisiler(kisi_id: 8, kisi_ad: "Mert", kisi_tel: "8888888")

        kisilerListesi.append(k1)
        kisilerListesi.append(k2)
        kisilerListesi.append(k3)
        kisilerListesi.append(k4)
        kisilerListesi.append(k5)
        kisilerListesi.append(k6)
        kisilerListesi.append(k7)
        kisilerListesi.append(k8)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        kisilerTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetayViewController
                gidilecekVC.kisi = kisi
            }
        }
    }
}

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Kisi ara : \(searchText)")
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource, CellProtocol {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListesi[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisilerCell", for: indexPath) as! KisilerTableViewCell
        cell.kisiAdLabel.text = kisi.kisi_ad
        cell.kisiNumaraLabel.text = kisi.kisi_tel
        cell.cellProtocol = self
        cell.indexPath = indexPath
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { contextAction, view, bool in
            let kisi = self.kisilerListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "Are you sure to delete \(kisi.kisi_ad!)?", preferredStyle: UIAlertController.Style.actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
            let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive) { action in
                self.kisilerListesi.remove(at: indexPath.row)
                self.kisilerTableView.reloadData()
            }
            
            alert.addAction(cancelAction)
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
            
        }
        
        deleteAction.image = UIImage(systemName: "trash.fill")
        deleteAction.image?.withTintColor(.systemBackground)
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func kisiBookmarked(indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
        print("\(kisi.kisi_ad!) bookmarked")
    }
}

