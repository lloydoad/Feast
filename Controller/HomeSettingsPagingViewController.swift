//
//  HomeSettingsPagingViewController.swift
//  Feast
//
//  Created by Lloyd Dapaah on 9/24/18.
//  Copyright © 2018 Lloyd Dapaah. All rights reserved.
//

import UIKit

class HomeSettingsPagingViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var headerUnderline: UIView!
    var xPositionOfHeaderUnderlineConstraint: NSLayoutConstraint!
    var homeButton: UIButton!
    var settingsButton: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        self.collectionView.backgroundColor = MAIN_BACKGROUND_COLOR
        self.collectionView.isPagingEnabled = true
        
        setupHeader()
        setupButtons()
        
        self.collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        self.collectionView.register(SettingsCollectionCellView.self, forCellWithReuseIdentifier: SettingsCollectionCellView.identifier)
    }
    
    func setupHeader() {
        headerUnderline = UIView()
        headerUnderline.backgroundColor = SHADOW_ORANGE_COLOR
        
        self.view.addSubview(headerUnderline)
        view.addSubview(headerUnderline)
        headerUnderline.translatesAutoresizingMaskIntoConstraints = false
        headerUnderline.heightAnchor.constraint(equalToConstant: 3).isActive = true
        headerUnderline.widthAnchor.constraint(equalToConstant: 98).isActive = true
        headerUnderline.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        
        xPositionOfHeaderUnderlineConstraint = headerUnderline.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -60)
        xPositionOfHeaderUnderlineConstraint.isActive = true
        headerUnderline.superview?.bringSubviewToFront(headerUnderline)
    }
    
    func setupButtons() {
        homeButton = UIButton(type: .system)
        homeButton.setAttributedTitle(NSAttributedString(string: "Home", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .light), NSAttributedString.Key.foregroundColor: SHADOW_ORANGE_COLOR]), for: .normal)
        homeButton.tag = 0
        homeButton.addTarget(self, action: #selector(pageToOtherView(sender:)), for: .touchUpInside)
        
        settingsButton = UIButton(type: .system)
        settingsButton.setAttributedTitle(NSAttributedString(string: "Setting", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .light), NSAttributedString.Key.foregroundColor: SHADOW_ORANGE_COLOR]), for: .normal)
        settingsButton.tag = 1
        settingsButton.addTarget(self, action: #selector(pageToOtherView(sender:)), for: .touchUpInside)
        
        self.view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 96, y: 40, width: 60, height: 28)
        homeButton.superview?.bringSubviewToFront(homeButton)
        
        self.view.addSubview(settingsButton)
        settingsButton.frame = CGRect(x: 220, y: 40, width: 60, height: 28)
        settingsButton.superview?.bringSubviewToFront(settingsButton)
    }
    
    @objc func pageToOtherView(sender: UIButton) {
        if sender.tag == 0 {
            guard collectionView.contentOffset.x != 0 else {return}
            collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .centeredHorizontally, animated: true)
        } else {
            guard collectionView.contentOffset.x != view.frame.width else {return}
            collectionView.scrollToItem(at: IndexPath(row: 1, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        xPositionOfHeaderUnderlineConstraint.constant = ((collectionView.contentOffset.x / 3.125) - 60)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
            cell.homeBackground.image = UIImage(named: "taco_background")
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsCollectionCellView.identifier, for: indexPath) as! SettingsCollectionCellView
            cell.searchHistoryButton.addTarget(self, action: #selector(presentSearchHistoryView), for: .touchUpInside)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    @objc func presentSearchHistoryView() {
        let searchHistoryNavigationView = UINavigationController(rootViewController: SearchHistoryTableViewController())
        self.present(searchHistoryNavigationView, animated: true, completion: nil)
    }
}
