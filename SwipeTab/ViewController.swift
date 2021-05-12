//
//  ViewController.swift
//  SwipeTab
//
//  Created by Sinchon on 2021/05/12.
//

import UIKit

class ViewController: SwipeViewController {
    @objc func push(sender _:UIBarButtonItem){
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.blue
        vc.title = "Cool"
        navigationController!.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(push))
        
        barButtonItem.tintColor = .black
        
        self.navigationItem.leftBarButtonItem = barButtonItem
    }


}

