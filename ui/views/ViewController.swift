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
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        _ = viewModel.kisilerListesi.subscribe(onNext: { liste in
            self.kisilerListesi = liste
            self.kisilerTableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.kisileriYukle()
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
        viewModel.araSearchBar(arananKisi: searchText)
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
//                self.kisilerListesi.remove(at: indexPath.row)
//                self.kisilerTableView.reloadData()
                self.viewModel.sil(kisi_id: kisi.kisi_id!)
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

