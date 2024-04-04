//
//  KisilerTableViewCell.swift
//  KisilerApp
//
//  Created by Alper Canımoğlu on 3.04.2024.
//

import UIKit

protocol CellProtocol {
    func kisiBookmarked(indexPath: IndexPath)
}

class KisilerTableViewCell: UITableViewCell {

    @IBOutlet weak var kisiAdLabel: UILabel!
    @IBOutlet weak var kisiNumaraLabel: UILabel!
    
    var cellProtocol: CellProtocol?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func bookmarkButton(_ sender: Any) {
        
        cellProtocol?.kisiBookmarked(indexPath: indexPath!)
        
    }
}
