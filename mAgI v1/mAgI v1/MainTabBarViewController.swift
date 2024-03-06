//
//  ViewController.swift
//  mAgI v1
//
//  Created by Zheng Taing on 2/11/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
     //   let vc3 = UINavigationController(rootViewController: SocialViewController())
       // let vc4 = UINavigationController(rootViewController: MessagesViewController())
    //    let vc5 = UINavigationController(rootViewController: ProfileViewController())
        
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        
        
        setViewControllers([vc1,vc2], animated: true)
    }


}

