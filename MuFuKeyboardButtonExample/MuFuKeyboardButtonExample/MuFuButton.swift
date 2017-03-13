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
    

    
    
    @IBInspectable var shadowRadius: CGFloat = 1.0 {
        didSet {
            shadowLayer.shadowRadius = shadowRadius
            shadowLayer.shadowOpacity = 1.0
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .lightGray {
        didSet {
            shadowLayer.fillColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
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
            case "Function":
                backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
                shadowColor = UIColor.lightGray
                setTitleColor(.black, for: .normal)
                cornerRadius = 4.0
            default:
                backgroundColor = .white
            }
            
        }
    }
    
    @IBInspectable var title: String = "Hi" {
        didSet {
            setTitle(title, for: .normal)
            image = nil
        }
    }
    
    @IBInspectable var image: UIImage? = nil {
        didSet {
            setImage(image, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //layer.shadowColor = UIColor.black.cgColor
        //layer.shadowOffset = CGSize(width: 0, height: 1)
        //layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        //layer.shadowOpacity = 1.0
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func prepareForInterfaceBuilder() {
        //layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        clipsToBounds = true
    }
    
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        let color: UIColor? = backgroundColor
        //if isHighlighted {
            //color = highlightColor
        //}
        
        let roundedRectanglePath = UIBezierPath(roundedRect: CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height), cornerRadius: cornerRadius)
        context?.saveGState()
        context?.setShadow(offset: shadowOffset, blur: shadowRadius, color: shadowColor.cgColor)
        color?.setFill()
        roundedRectanglePath.fill()
        context?.restoreGState()
        
        shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = shadowColor.cgColor
        
        //shadowLayer.shadowColor = UIColor.clear.cgColor
        //shadowLayer.shadowPath = shadowLayer.path
        //shadowLayer.shadowOffset = shadowOffset
        //shadowLayer.shadowOpacity = 0.8
        //shadowLayer.shadowRadius = 0
        
        //layer.insertSublayer(shadowLayer, at: 0)
        shadowLayer.frame = layer.frame
        shadowLayer.frame.origin.x += shadowOffset.width
        shadowLayer.frame.origin.y += shadowOffset.height
        superview?.layer.insertSublayer(shadowLayer, below: layer)

        layer.masksToBounds = false
        clipsToBounds = true

    }
    
//    init() {
//        var frame = CGRect.zero
//        frame.size.width = 30.0
//        frame.size.height = 45.0
//        super.init(frame: frame)
//        titleLabel?.text = "MuFuButton"
//        imageView?.image = UIImage(named:"sqrt_iPhone")
//        cornerRadius =  5.0
//    }
//    
//
    
}
