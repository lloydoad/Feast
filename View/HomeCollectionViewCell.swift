//
//  HomeCollectionViewCell.swift
//  Feast
//
//  Created by Lloyd Dapaah on 9/24/18.
//  Copyright © 2018 Lloyd Dapaah. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    
    var homeBackground: UIImageView!
    var mainTitleTag: UILabel!
    var mainTitle: UILabel!
    var searchButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = MAIN_BACKGROUND_COLOR
        
        setupBackground()
        setupShaders()
        setupSearchButton()
        setupLabels()
    }
    
    func setupBackground() {
        homeBackground = UIImageView()
        homeBackground.backgroundColor = .clear
        homeBackground.contentMode = .scaleAspectFill
        
        contentView.addSubview(homeBackground)
        boundEdges(of: homeBackground, to: contentView, with: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    func setupShaders() {
        let clearShadow = UIColor(hex: 0x000000, alpha: 0)
        let fullBlackShadow = UIColor(hex: 0x000000, alpha: 1)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.colors = [clearShadow.cgColor, fullBlackShadow.cgColor]
        
        let bottomShaders = UIView()
        contentView.addSubview(bottomShaders)
        bottomShaders.translatesAutoresizingMaskIntoConstraints = false
        bottomShaders.heightAnchor.constraint(equalToConstant: 332).isActive = true
        bottomShaders.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        bottomShaders.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        bottomShaders.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: 332)
        bottomShaders.layer.insertSublayer(gradientLayer, at: 0)
        
        let topGradientLayer = CAGradientLayer()
        topGradientLayer.endPoint = CGPoint.zero
        topGradientLayer.startPoint = CGPoint(x: 0, y: 1)
        topGradientLayer.colors = [clearShadow.cgColor, fullBlackShadow.cgColor]
        
        let topShader = UIView()
        contentView.addSubview(topShader)
        topShader.translatesAutoresizingMaskIntoConstraints = false
        topShader.heightAnchor.constraint(equalToConstant: 107).isActive = true
        topShader.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        topShader.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        topShader.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        topGradientLayer.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: 107)
        topShader.layer.insertSublayer(topGradientLayer, at: 0)
    }
    
    func setupSearchButton() {
        searchButton = UIButton(type: .system)
        searchButton.setAttributedTitle(NSAttributedString(string: "Search For More", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .light), NSAttributedString.Key.foregroundColor: SHADOW_ORANGE_COLOR]), for: .normal)
        
        self.contentView.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -28).isActive = true
        searchButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
    }
    
    func setupLabels() {
        mainTitle = UILabel()
        mainTitle.textColor = .white
        mainTitle.font = UIFont.systemFont(ofSize: 78, weight: .ultraLight)
        mainTitle.text = "TACOS"
        mainTitle.numberOfLines = 0
        
        self.contentView.addSubview(mainTitle)
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        mainTitle.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30).isActive = true
        mainTitle.bottomAnchor.constraint(equalTo: self.searchButton.topAnchor, constant: -17).isActive = true
        
        mainTitleTag = UILabel()
        mainTitleTag.textColor = .white
        mainTitleTag.textAlignment = .center
        mainTitleTag.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        mainTitleTag.numberOfLines = 1
        mainTitleTag.text = "CHEAP EATS"
        mainTitleTag.clipsToBounds = false
        
        let xPadding: CGFloat = 5
        let yPadding: CGFloat = 2
        self.contentView.addSubview(mainTitleTag)
        mainTitleTag.translatesAutoresizingMaskIntoConstraints = false
        mainTitleTag.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30 + xPadding).isActive = true
        mainTitleTag.bottomAnchor.constraint(equalTo: self.mainTitle.topAnchor, constant: -yPadding).isActive = true
        
        let border = UIView()
        border.backgroundColor = .clear
        border.layer.borderColor = UIColor.white.cgColor
        border.layer.borderWidth = 1.5
        boundEdges(of: border, to: mainTitleTag, with: UIEdgeInsets(top: -yPadding, left: -xPadding, bottom: -yPadding, right: -xPadding))
        
    }
}
