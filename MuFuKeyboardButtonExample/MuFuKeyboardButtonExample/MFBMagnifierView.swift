//
//  MFBMagnifierView.swift
//  MuFuKeyboardButtonExample
//
//  Created by Ben Hambrecht on 15.03.17.
//  Copyright © 2017 Ben Hambrecht. All rights reserved.
//

import UIKit

class MFBMagnifierView: UIView {
    
    var popoverDirection: MuFuKeyboardButtonPopoverDirection = .Inner

    var bezierPath = UIBezierPath()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = false
        
        backgroundColor = .clear
        
        // Generate the overlay
        bezierPath = magnifierViewPath()
        // expand the frame
        
        let padding: CGFloat = 10
        
        let x0 = frame.origin.x
        let y0 = frame.origin.y
        let w0 = frame.size.width
        let h0 = frame.size.height
        
        let w = bezierPath.bounds.width
        let h = bezierPath.bounds.height
        
        switch popoverDirection {
        case .Inner:
            self.frame = CGRect(x: x0 - (w - w0)/2 - padding,
                                y: y0 - (h - h0) - padding,
                                width: w + 2 * padding,
                                height: h + 2 * padding)
        case .Left:
            self.frame = CGRect(x: x0 - (w - w0) - padding,
                                y: y0 - (h - h0) - padding,
                                width: w + 2 * padding,
                                height: h + 2 * padding)
        case .Right:
            self.frame = CGRect(x: x0 - padding,
                                y: y0 - (h - h0) - padding,
                                width: w + 2 * padding,
                                height: h + 2 * padding)

        }
        
        bezierPath.apply(CGAffineTransform(translationX: padding, y: padding))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        
        
        
        // Position the overlay
        let keyRect = bounds
        
        //        magnifierView.bounds = bezierPath.bounds
        //        magnifierView.frame.origin.x = frame.midX - magnifierView.bounds.width / 2.0
        //        magnifierView.frame.origin.y = frame.maxY - magnifierView.bounds.height

        clipsToBounds = false
        layer.masksToBounds = false
        
        //backgroundColor = .red
        //alpha = 0.5
        
        let context = UIGraphicsGetCurrentContext()
        
        let highlightColor = UIColor.yellow
        // Overlay path & shadow
        
        //// Shadow Declarations
        let shadow = UIColor.gray
        
        var shadowOffset = CGSize(width: 0, height: 0.5)
        var shadowBlurRadius = 2.0
        
        //// Rounded Rectangle Drawing
        context?.saveGState()
        context?.setShadow(offset: shadowOffset, blur: CGFloat(shadowBlurRadius), color: shadow.cgColor)
        highlightColor.setFill()
        bezierPath.fill()
        context!.restoreGState()
        
        
        // Draw the key shadow sliver
        
        //        //// Color Declarations
        //        let color = highlightColor
        //
        //
        //        //// Rounded Rectangle Drawing
        //        let roundedRectanglePath = UIBezierPath.init(roundedRect: CGRect(x: keyRect.origin.x, y: keyRect.origin.y, width: keyRect.size.width, height: keyRect.size.height - 1.0), cornerRadius: 4.0)
        //        context?.saveGState()
        //        context?.setShadow(offset: shadowOffset, blur: CGFloat(shadowBlurRadius), color: shadow.cgColor)
        //        color.setFill()
        //        roundedRectanglePath.fill()
        //        context?.restoreGState()
        

    }
 
    
    
    func magnifierViewPath() -> UIBezierPath {
        
        let keyRect = bounds
        let insets = UIEdgeInsets(top: 7.0, left: 13.0, bottom: 7.0, right: 13.0)
        let upperWidth = frame.width + insets.left + insets.right
        let lowerWidth = frame.width
        let majorRadius: CGFloat = 10.0
        let minorRadius: CGFloat = 4.0
        
        let path = TurtleBezierPath()
        path.home()
        path.lineWidth = 0.0
        path.lineCapStyle = CGLineCap.round
        
        switch popoverDirection {
            
        case .Inner:
            
            path.rightArc(majorRadius, turn: 90.0) // #1
            path.forward(upperWidth - 2.0 * majorRadius) // #2 top
            path.rightArc(majorRadius, turn: 90.0) // #3
            path.forward(keyRect.height -  2.0 * majorRadius + insets.top + insets.bottom) // #4 right big
            path.rightArc(majorRadius, turn: 48.0) // #5
            path.forward(8.5)
            path.leftArc(majorRadius, turn: 48.0) // #6
            path.forward(keyRect.height - 8.5 + 1.0)
            path.rightArc(minorRadius, turn: 90.0)
            path.forward(lowerWidth - 2.0 * minorRadius) // lowerWidth - 2.0 * minorRadius + 0.5
            path.rightArc(minorRadius, turn: 90.0)
            path.forward(keyRect.height - 2 * minorRadius)
            path.leftArc(majorRadius, turn: 48.0)
            path.forward(8.5)
            path.rightArc(majorRadius, turn: 48.0)
            path.close()
            
            var offsetX: CGFloat = 0.0
            var offsetY: CGFloat = 10.0
            
            //offsetX = frame.midX - path.bounds.midX
            //offsetY = frame.maxY - path.bounds.height
            //offsetY = keyRect.maxY - pathBoundingBox.maxY
            
            path.apply(CGAffineTransform(translationX: offsetX, y: offsetY))
            
            break
            
            
        case .Left:
            
            path.rightArc(majorRadius, turn: 90.0) // #1
            path.forward(upperWidth - 2.0 * majorRadius) // #2 top
            path.rightArc(majorRadius, turn: 90.0) // #3
            path.forward(keyRect.height - 2.0 * majorRadius + insets.top + insets.bottom) // #4 right big
            path.rightArc(majorRadius, turn: 45.0) // #5
            path.forward(28.0) // #6
            path.leftArc(majorRadius, turn: 45.0) // #7
            path.forward(keyRect.height - 26.0 + (insets.left + insets.right) * 0.25) // #8
            path.rightArc(minorRadius, turn: 90.0) // #9
            path.forward(path.currentPoint.x - minorRadius) // #10
            path.rightArc(minorRadius, turn: 90.0) // #11
            path.close()
            
            var offsetX: CGFloat = 0.0
            var offsetY: CGFloat = 0.0
            let pathBoundingBox = path.bounds
            
            offsetX = keyRect.maxX - path.bounds.width
            offsetY = keyRect.maxY - pathBoundingBox.height - path.bounds.minY
            
            path.apply(CGAffineTransform(scaleX: -1.0, y: 1.0).translatedBy(x: -offsetX - path.bounds.width, y: offsetY))
            
            break
            
            
        case .Right:
            
            path.rightArc(majorRadius, turn: 90.0) // #1
            path.forward(upperWidth - 2.0 * majorRadius) // #2
            path.rightArc(majorRadius, turn: 90.0) // #3
            path.forward(keyRect.height - 2.0 * majorRadius + insets.top + insets.bottom) // #4 right big
            path.rightArc(majorRadius, turn: 45.0) // #5
            path.forward(28.0) // #6
            path.leftArc(majorRadius, turn: 45.0) // #7
            path.forward(keyRect.height - 26.0 + (insets.left + insets.right) * 0.25) // #8
            path.rightArc(minorRadius, turn: 90.0) // #9
            path.forward(path.currentPoint.x - minorRadius) // #10
            path.rightArc(minorRadius, turn: 90.0) // #11
            path.close()
            
            var offsetX: CGFloat = 0.0
            var offsetY: CGFloat = 0.0
            let pathBoundingBox = path.bounds
            
            offsetX = keyRect.minX
            offsetY = keyRect.maxY - pathBoundingBox.height - path.bounds.minY
            
            path.apply(CGAffineTransform(translationX: offsetX, y: offsetY))
            
            break
            
        default:
            
            break
            
        }
        
        let path2 = UIBezierPath(cgPath: path.cgPath)
        
        return path
        
    }

    
    
}
