//
//  Common.swift
//  KisilerApp
//
//  Created by Alper Canımoğlu on 6.05.2024.
//

import Foundation
import UIKit

class Common : NSObject{
    
    class func showAlert(errorTitle: String, errorMessage: String, vc: UIViewController){
            let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
            vc.present(alert, animated: true)
    }
}
