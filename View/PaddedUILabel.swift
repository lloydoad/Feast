//
//  PaddedUILabel.swift
//  Feast
//
//  Created by Lloyd Dapaah on 9/25/18.
//  Copyright © 2018 Lloyd Dapaah. All rights reserved.
//

import UIKit

class PaddedUILabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 3, left: 6, bottom: 3, right: 6)
        super.drawText(in: rect.inset(by: insets))
    }
}
