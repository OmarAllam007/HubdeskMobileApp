//
//  CustomLabel.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 05/07/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CustomLabel:UILabel {
    
    @IBInspectable var topInset:CGFloat = 5.0
    @IBInspectable var bottomInset:CGFloat = 5.0
    @IBInspectable var leftInset:CGFloat = 5.0
    @IBInspectable var rightInset:CGFloat = 5.0
    
    override func draw(_ rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        rect.inset(by: insets)
        super.drawText(in: rect)
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            return contentSize
        }
    }
}
