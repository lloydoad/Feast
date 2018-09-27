//
//  SearchHistoryTableViewController.swift
//  Feast
//
//  Created by Lloyd Dapaah on 9/27/18.
//  Copyright © 2018 Lloyd Dapaah. All rights reserved.
//

import UIKit

class SearchHistoryTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        self.view.backgroundColor = MAIN_BACKGROUND_COLOR
        
        setupNavigation()
    }
    
    func setupNavigation() {
        self.navigationController?.navigationBar.barTintColor = SHADOW_ORANGE_COLOR
        self.navigationItem.title = "Search History"
        
        let dismissButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissSearchHistory))
        dismissButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        self.navigationItem.leftBarButtonItem = dismissButton
    }
    
    @objc func dismissSearchHistory() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
