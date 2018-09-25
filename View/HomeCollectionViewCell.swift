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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = MAIN_BACKGROUND_COLOR
        
        setupBackground()
        setupShaders()
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
    
    func setupLabels() {
        let verticalStack = getPresetUIStackView(axis: .vertical, alignment: .leading, distribution: .fill, spacing: 0)
        
        contentView.addSubview(verticalStack)
        verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100).isActive = true
        verticalStack.widthAnchor.constraint(greaterThanOrEqualToConstant: 221).isActive = true
        verticalStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 103).isActive = true
        
        mainTitleTag = UILabel()
        mainTitleTag.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        mainTitleTag.textColor = .white
        mainTitleTag.layer.borderColor = UIColor.white.cgColor
        mainTitleTag.layer.borderWidth = 1.5
        mainTitleTag.text = "CHEAP EATS"
        
        mainTitle = UILabel()
        mainTitle.font = UIFont.systemFont(ofSize: 78, weight: .ultraLight)
        mainTitle.textColor = .white
        mainTitle.text = "TACOS"
        
        verticalStack.addArrangedSubview(mainTitleTag)
        verticalStack.addArrangedSubview(mainTitle)
    }
}
