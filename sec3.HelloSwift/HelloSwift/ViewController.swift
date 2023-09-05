//
//  ViewController.swift
//  HelloSwift
//
//  Created by 김유미 on 2023/09/05.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lbl: UILabel!
    @IBAction func changeLabel(_ sender: UIButton) {
        lbl.text = "Hello, Swift"   // change label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
}
