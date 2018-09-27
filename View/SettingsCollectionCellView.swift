//
//  SettingsCollectionCellView.swift
//  Feast
//
//  Created by Lloyd Dapaah on 9/26/18.
//  Copyright © 2018 Lloyd Dapaah. All rights reserved.
//

import UIKit

class SettingsCollectionCellView: UICollectionViewCell {
    static let identifier = "SettingsCollectionCellView"
    
    var reSyncButton: UIButton!
    var timeSinceLastSync: UILabel!
    var syncSwitchControl: UISwitch!
    var searchMileSlideControl: UISlider!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = MAIN_BACKGROUND_COLOR
        
        setupBottomOfView()
        setupSettingsTable()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBottomOfView() {
        reSyncButton = UIButton(type: .system)
        reSyncButton.setAttributedTitle(NSAttributedString(string: "Re-Sync", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .light), NSAttributedString.Key.foregroundColor: SHADOW_ORANGE_COLOR]), for: .normal)
        
        self.contentView.addSubview(reSyncButton)
        reSyncButton.translatesAutoresizingMaskIntoConstraints = false
        reSyncButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30).isActive = true
        reSyncButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -55).isActive = true
        
        let syncedIndicatorLabel = getBasicFormattedLabel(defaultText: "Synced", with: 18, of: .light, and: SHADOW_ORANGE_COLOR)
        timeSinceLastSync = getBasicFormattedLabel(defaultText: "xx mins ago", with: 18, of: .light, and: .white)
        
        let syncTimerHorizontalStack = getPresetUIStackView(axis: .horizontal, alignment: .center, distribution: .fillProportionally, spacing: 10)
        syncTimerHorizontalStack.addArrangedSubview(syncedIndicatorLabel)
        syncTimerHorizontalStack.addArrangedSubview(timeSinceLastSync)
        
        self.contentView.addSubview(syncTimerHorizontalStack)
        syncTimerHorizontalStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30).isActive = true
        syncTimerHorizontalStack.centerYAnchor.constraint(equalTo: reSyncButton.centerYAnchor).isActive = true
    }
    
    func setupSettingsTable() {
        let gpsAutoSyncLabel = getBasicFormattedLabel(defaultText: "GPS auto-sync", with: 28, of: .light, and: SHADOW_ORANGE_COLOR)
        syncSwitchControl = UISwitch()
        syncSwitchControl.onTintColor = FLAT_DARK_GREEN_COLOR
        let gpsAutoSyncHorizontalStack = getPresetUIStackView(axis: .horizontal, alignment: .center, distribution: .fill, spacing: 0)
        add(ArrangedSubviews: [gpsAutoSyncLabel, UIView(), syncSwitchControl], to: gpsAutoSyncHorizontalStack)
        
        let searchRadiusTitleLabel = getBasicFormattedLabel(defaultText: "Search mile radius", with: 28, of: .light, and: SHADOW_ORANGE_COLOR)
        let mileMarkHorizontalStack = UIStackView()
        mileMarkHorizontalStack.axis = .horizontal
        mileMarkHorizontalStack.alignment = .center
        mileMarkHorizontalStack.distribution = .fillEqually
        for number in 10...30 {
            guard number % 10 == 0 else { continue }
            
            let markLabel = getBasicFormattedLabel(defaultText: "\(number)", with: 15, of: .light, and: SHADOW_ORANGE_COLOR)
            if number == 10 { markLabel.textAlignment = .left }
            else if number == 30 { markLabel.textAlignment = .right }
            else { markLabel.textAlignment = .center }
            
            mileMarkHorizontalStack.addArrangedSubview(markLabel)
        }
        searchMileSlideControl = UISlider()
        searchMileSlideControl.minimumTrackTintColor = SHADOW_ORANGE_COLOR
        searchMileSlideControl.minimumValue = 10
        searchMileSlideControl.maximumValue = 30
        searchMileSlideControl.value = 12.5
        let searchRadiusVerticalStack = getPresetUIStackView(axis: .vertical, alignment: .fill, distribution: .fillProportionally, spacing: 0)
        add(ArrangedSubviews: [mileMarkHorizontalStack, searchMileSlideControl], to: searchRadiusVerticalStack)
        
        let searchHistoryButton = UIButton(type: .system)
        searchHistoryButton.setAttributedTitle(NSAttributedString(string: "Search History", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .light), NSAttributedString.Key.foregroundColor: SHADOW_ORANGE_COLOR]), for: .normal)
        
        let mainSettingVerticalStack = getPresetUIStackView(axis: .vertical, alignment: .fill, distribution: .fillEqually, spacing: 30)
        mainSettingVerticalStack.addArrangedSubview(gpsAutoSyncHorizontalStack)
        mainSettingVerticalStack.addArrangedSubview(searchRadiusTitleLabel)
        mainSettingVerticalStack.addArrangedSubview(searchRadiusVerticalStack)
        mainSettingVerticalStack.addArrangedSubview(searchHistoryButton)
        
        self.contentView.addSubview(mainSettingVerticalStack)
        mainSettingVerticalStack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 113).isActive = true
        mainSettingVerticalStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30).isActive = true
        mainSettingVerticalStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30).isActive = true
        mainSettingVerticalStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
    }
    
    func getBasicFormattedLabel(defaultText: String, with size: CGFloat, of weight: UIFont.Weight, and color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = defaultText
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        return label
    }
    
    func add(ArrangedSubviews: [UIView], to stack: UIStackView) {
        for view in ArrangedSubviews {
            stack.addArrangedSubview(view)
        }
    }
}
