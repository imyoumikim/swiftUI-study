//
//  ViewController.swift
//  sec26
//
//  Created by 김유미 on 2023/09/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, macOS 10.3, *) {    // 버전은 runtime에 확인. 논리연산자로 연결 불가. ','로 연결 가능.
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // 지원하지 않는 기능에 대한 안내 메시지 or 이전 버전에 적합한 별도의 UI
        }
    }
}
