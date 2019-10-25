//
//  NewsViewController.swift
//  PllugNews
//
//  Created by Kovalyk Nazar on 5/13/19.
//  Copyright © 2019 Kovalyk Nazar. All rights reserved.
//

import UIKit

// -------------------------------------
// MARK: - NewsViewController
// -------------------------------------
class NewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkApi().getNews { result in
            switch result {
            case .success(let articles):
                print(articles)
            case .failure(let error):
                print(error)
            }
        }
    
    }

}

