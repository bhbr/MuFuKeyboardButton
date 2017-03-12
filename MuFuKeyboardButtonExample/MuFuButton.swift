//
//  MuFuButton.swift
//  MuFuKeyboardButtonExample
//
//  Created by Ben Hambrecht on 12.03.17.
//  Copyright © 2017 Ben Hambrecht. All rights reserved.
//

import UIKit

@IBDesignable class MuFuButton: UIButton {

    @IBInspectable var highlightColor: UIColor = .blue
    @IBInspectable var shadowColor: UIColor = .gray
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.1, height: 1.1)
    @IBInspectable var shadowBlurRadius: CGFloat = 0.0
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        var color = backgroundColor
        if isHighlighted {
            color = highlightColor
        }
        
        let roundedRectanglePath = UIBezierPath(roundedRect: CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height - 1.0), cornerRadius: cornerRadius)
        context?.saveGState()
        context?.setShadow(offset: shadowOffset, blur: shadowBlurRadius, color: shadowColor.cgColor)
        color?.setFill()
        roundedRectanglePath.fill()
        context?.restoreGState()
        
    }
    
    init() {
        var frame = CGRect.zero
        frame.size.width = 30.0
        frame.size.height = 45.0
        super.init(frame: frame)
        titleLabel?.text = "MuFuButton"
        imageView?.image = UIImage(named:"sqrt_iPhone")
        cornerRadius =  5.0
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        cornerRadius = 5.0
    }
    
    override func prepareForInterfaceBuilder() {
        titleLabel?.text = "MuFuButton"
        imageView?.image = UIImage(named:"sqrt_iPhone")
        
        highlightColor = .blue
        shadowColor = .gray
        shadowOffset = CGSize(width: 0.1, height: 1.1)
        shadowBlurRadius = 0.0
        cornerRadius =  5.0
        
    }

}
