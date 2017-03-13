//
//  MuFuButton.swift
//  MuFuKeyboardButtonExample
//
//  Created by Ben Hambrecht on 12.03.17.
//  Copyright © 2017 Ben Hambrecht. All rights reserved.
//

import UIKit


let IPHONE_BUTTON_WIDTH: CGFloat = 26.0
let IPHONE_BUTTON_HEIGHT: CGFloat = 39.0
let IPAD_BUTTON_WIDTH: CGFloat = 57.0
let IPAD_BUTTON_HEIGHT: CGFloat = 55.0

let DEFAULT_BUTTON_BG_COLOR: UIColor = .white
let SPECIAL_BUTTON_BG_COLOR = UIColor(red: 174.0/255.0, green: 179.0/255.0, blue: 189.0/255.0, alpha: 1.0)

let DEFAULT_OPTIONS_VIEW_DELAY: Float = 0.3


@IBDesignable class MuFuButton: UIButton {

    @IBInspectable var highlightColor: UIColor = .blue
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0

        }
    }
    
    
    var shadowLayer = CAShapeLayer()
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet {
            shadowLayer.opacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .lightGray {
        didSet {
            shadowLayer.fillColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 1) {
        didSet {
            shadowLayer.frame = frame
            shadowLayer.frame.origin.x += shadowOffset.width
            shadowLayer.frame.origin.y += shadowOffset.height
        }
    }
    
    
    
    @IBInspectable var customType: String = "Character" {
        didSet {
            switch customType {
            case "Character":
                backgroundColor = .white
                shadowColor = UIColor.lightGray
                setTitleColor(.black, for: .normal)
                cornerRadius = 4.0
                
            case "Function":
                backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
                shadowColor = UIColor.lightGray
                setTitleColor(.black, for: .normal)
                cornerRadius = 4.0
            case "Custom":
                break
            default:
                break
            }
            
        }
    }
    
//    @IBInspectable var title: String = "Button" {
//        didSet {
//            setTitle(title, for: .normal)
//            image = nil
//        }
//    }
//    
//    @IBInspectable var image: UIImage? = nil {
//        didSet {
//            setImage(image, for: .normal)
//        }
//    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func prepareForInterfaceBuilder() {
        setTitle("Button", for: .normal)
        layer.masksToBounds = false
        clipsToBounds = true
        imageView?.contentMode = .scaleAspectFit
    }
    
    
    override func draw(_ rect: CGRect) {
        
        imageView?.contentMode = .scaleAspectFit
        
        let context = UIGraphicsGetCurrentContext()
        var color: UIColor? = backgroundColor
        
        if isHighlighted {
            color = highlightColor
        }
        
        let roundedRectanglePath = UIBezierPath(roundedRect: CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height), cornerRadius: cornerRadius)
        context?.saveGState()
        context?.setShadow(offset: shadowOffset, blur: 0, color: shadowColor.cgColor)
        color?.setFill()
        roundedRectanglePath.fill()
        context?.restoreGState()
        
        shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = shadowColor.cgColor
        shadowLayer.opacity = shadowOpacity
        
        shadowLayer.frame = layer.frame
        shadowLayer.frame.origin.x += shadowOffset.width
        shadowLayer.frame.origin.y += shadowOffset.height
        superview?.layer.insertSublayer(shadowLayer, below: layer)

        layer.masksToBounds = false
        clipsToBounds = true

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    

    
}
