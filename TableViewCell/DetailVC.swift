//
//  DetailVC.swift
//  TableViewCell
//
//  Created by techmaster on 7/28/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var lbl_TD: UILabel!
    @IBOutlet weak var lbl_QD: UILabel!
 var dicCountry = NSMutableDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_QD.text = dicCountry.value(forKey: "coutry") as? String
        lbl_TD.text = dicCountry.value(forKey: "capital") as? String
        image.image = UIImage(named: dicCountry.value(forKey: "flag") as! String)
        
    }

   
    }
