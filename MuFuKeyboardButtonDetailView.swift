//
// MuFuKeyboardButton.swift
// Created by Ben Hambrecht on 5 March 2017.
//
// Distributed under MIT license.
//
// The MIT License (MIT)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


// DEFAULT VALUES FOR MODIFIABLE OPTIONS //


// when tapped, the root button's shadow becomes darker
let DEFAULT_ROOT_SHADOW_COLOR = UIColor.black.withAlphaComponent(0.5)
let DEFAULT_ROOT_SHADOW_OFFSET = CGSize(width: 0.1, height: 1.1)
let DEFAULT_ROOT_SHADOW_BLUR_RADIUS: CGFloat = 0.0

let DEFAULT_DETAIL_SHADOW_COLOR: UIColor = .red // should be overwritten by initializer
let DEFAULT_DETAIL_SHADOW_OFFSET = CGSize(width: 0, height: 0.5)
let DEFAULT_DETAIL_SHADOW_BLUR_RADIUS: CGFloat = 2.0

let DEFAULT_IPHONE_SHADOW_COLOR = UIColor.black.withAlphaComponent(0.5)
let DEFAULT_IPHONE_ROOT_SHADOW_OFFSET = CGSize(width: 0.1, height: 1.1)
let DEFAULT_IPHONE_SHADOW_BLUR_RADIUS: CGFloat = 0.0
let DEFAULT_IPHONE_DETAIL_SHADOW_OFFSET = CGSize(width: 0, height: 0.5)
let DEFAULT_IPHONE_DETAIL_SHADOW_BLUR_RADIUS: CGFloat = 2.0

let DEFAULT_IPAD_SHADOW_COLOR = UIColor.black.withAlphaComponent(0.25)
let DEFAULT_IPAD_ROOT_SHADOW_OFFSET = CGSize.zero
let DEFAULT_IPAD_SHADOW_BLUR_RADIUS: CGFloat = 0.0
let DEFAULT_IPAD_DETAIL_SHADOW_OFFSET = CGSize.zero
let DEFAULT_IPAD_DETAIL_SHADOW_BLUR_RADIUS: CGFloat = 2.0


// VALUES FOR CONSTANTS (CANNOT BE MODIFIED WITHOUT BREAKING) //

let MAGNIFIER_TITLE_X_INSET: CGFloat = 10.0
let MAGNIFICATION_FACTOR: CGFloat = 1.5 // for title image

let OPTION_X_GAP: CGFloat = 6.0
let OPTION_Y_GAP: CGFloat = 6.0
let OPTION_MARGIN: CGFloat = 7.0
let OPTION_HEIGHT_PADDING: CGFloat = 10.0 - 3.0
let OPTION_RECT_X_INSET: CGFloat = 0.0
let OPTION_RECT_Y_INSET: CGFloat = 0.5
let OPTION_RECT_Y_OFFSET_PADDING: CGFloat = 25.0

let DETAIL_TURN_ANGLE_OUTER: CGFloat = 45.0 // for .Left and .Right
let DETAIL_TURN_ANGLE_INNER: CGFloat = 48.0
let DETAIL_DIAGONAL_LENGTH: CGFloat = 8.5 // connecting the detail to the root button
let DETAIL_LOWER_SUBTRACTED_HEIGHT: CGFloat = 8.5 - 1.0

let IPHONE_MAGNIFIER_EDGE_INSET_X: CGFloat = 13.0
let IPHONE_MAGNIFIER_EDGE_INSET_Y: CGFloat = 7.0
let IPHONE_DETAIL_MAJOR_RADIUS: CGFloat = 10.0
let IPHONE_DETAIL_MINOR_RADIUS: CGFloat = 4.0
let IPHONE_DETAIL_INNER_OFFSET_Y_PADDING: CGFloat = 10.0

let IPAD_DETAIL_INNER_OFFSET_Y_PADDING: CGFloat = -6.0
let IPAD_OPTIONS_HEIGHT_PADDING: CGFloat = 12.0


import UIKit

enum MuFuKeyboardButtonDetailViewType {
    case Magnifier
    case Options
}


class MuFuKeyboardButtonDetailView: UIView {
    
    var type: MuFuKeyboardButtonDetailViewType
    var highlightedInputIndex: NSInteger
    
    var rootButton: MuFuKeyboardButton
    var inputOptionsRects: Array<CGRect> = []
    
    var cornerRadius: CGFloat = 0.0 // should be overwritten
    
    var rootShadowColor = DEFAULT_ROOT_SHADOW_COLOR
    var rootShadowOffset = DEFAULT_ROOT_SHADOW_OFFSET
    var rootShadowBlurRadius = DEFAULT_ROOT_SHADOW_BLUR_RADIUS
    
    var detailShadowColor = DEFAULT_DETAIL_SHADOW_COLOR
    var detailShadowOffset = DEFAULT_DETAIL_SHADOW_OFFSET
    var detailShadowBlurRadius = DEFAULT_DETAIL_SHADOW_BLUR_RADIUS
    
    var magnifierEdgeInsetX: CGFloat = IPHONE_MAGNIFIER_EDGE_INSET_X
    var magnifierEdgeInsetY: CGFloat = IPHONE_MAGNIFIER_EDGE_INSET_Y
    var detailMajorRadius: CGFloat = IPHONE_DETAIL_MAJOR_RADIUS
    var detailMinorRadius: CGFloat = IPHONE_DETAIL_MINOR_RADIUS
    
    var titleLabel = UILabel() // if magnifier
    var titleImageView = UIImageView() // if magnifier
    var titleLabelFont: UIFont = .systemFont(ofSize: 6.0) // if this default value is not overwritten, sth is wrong
    
    var titleType: MuFuKeyboardButtonTitleType = .Label {
        // whether the magnifier shows a label or an image
        didSet {
            //NSLog("MFKBDV.titleType.didSet")
            if (type == .Options) { // then this is no magnifier anyway, hide both label and image
                titleLabel.isHidden = true
                return
            }
            
            switch titleType {
            case .Label:
                    titleLabel.isHidden = false
                    titleImageView.isHidden = true
            case .Image:
                    titleLabel.isHidden = true
                    titleImageView.isHidden = false
            }
        }
    }
    
    var magnifierTitleXInset: CGFloat = MAGNIFIER_TITLE_X_INSET
    var magnificationFactor: CGFloat = MAGNIFICATION_FACTOR
    
    init(keyboardButton: MuFuKeyboardButton, newType: MuFuKeyboardButtonDetailViewType) {
        //NSLog("MFKBDV.init(keyboardButton:newType:)")
        var frame = UIScreen.main.bounds
        
        if (UIDevice.current.orientation.isLandscape) {
            frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        }
        
        type = newType
        highlightedInputIndex = NSNotFound
        
        rootButton = keyboardButton
        
        cornerRadius = rootButton.cornerRadius
        rootShadowColor = rootButton.color!
        
        
//// ??? DELETE ???
        
//        if (rootButton.optionsFanoutDirection != .Inner) {
//            rootButton.optionsFanoutDirection = rootButton.optionsFanoutDirection
//        } else {
//            // Determine the position
//            let leftPadding = rootButton.frame.minX
//            let rightPadding = (rootButton.superview?.frame.maxX)! - rootButton.frame.maxX
//            rootButton.optionsFanoutDirection = (leftPadding > rightPadding ? .Left : .Right)
//        }
        
        super.init(frame: frame)
        
        setupAppearanceFromDevice()
        
        backgroundColor = .clear
        isUserInteractionEnabled = false
        
        // If this is a magnifier, setup the title label or image
        
        if (newType == .Magnifier) {
        
            //NSLog("--- setting up titleLabel")
            
            // Label
            titleLabel.frame = magnifiedInputViewPath().bounds
            titleLabel.text = rootButton.titleLabel.text ?? rootButton.inputID
            titleLabel.font = rootButton.magnifierTitleLabelFont //  titleLabelFont // button?.titleLabel.font //.withSize(44.0)
            titleLabel.textColor = rootButton.titleColor
            titleLabel.backgroundColor = .clear
            titleLabel.textAlignment = .center
            titleLabel.clipsToBounds = false
            titleLabel.contentMode = .scaleAspectFit
            titleLabel.adjustsFontSizeToFitWidth = true
            //// ??? DELETE ???
            
            
    //        if rootButton.optionsFanoutDirection == .Left {
    //            titleLabel.frame.origin.x += 20.0
    //        } else if rootButton.optionsFanoutDirection == .Right {
    //            titleLabel.frame.origin.x -= 20.0
    //        }
            
            if rootButton.position == .Left {
                titleLabel.frame.origin.x += magnifierTitleXInset
            } else if rootButton.position == .Right {
                titleLabel.frame.origin.x -= magnifierTitleXInset
            }
            
            self.addSubview(titleLabel)
            
            //NSLog("--- setting up titleImageView")
            
            // Image
            let newFrame = magnifiedInputViewPath().bounds
            titleImageView.frame = CGRect(x: newFrame.origin.x, y: newFrame.origin.y, width: newFrame.size.width, height: rootButton.frame.size.height)
            titleImageView.backgroundColor = .clear
            titleImageView.image = UIImage()
            titleImageView.autoresizingMask = []

            //// ??? DELETE ???
            
    //        if rootButton.optionsFanoutDirection == .Left {
    //            titleImageView.frame.origin.x += 20.0
    //        } else if rootButton.optionsFanoutDirection == .Right {
    //            titleImageView.frame.origin.x -= 20.0
    //        } else if rootButton.optionsFanoutDirection == .Inner {
    //            // no adjustment necessary (?)
    //        }
            if rootButton.position == .Left {
                titleImageView.frame.origin.x += magnifierTitleXInset
            } else if rootButton.position == .Right {
                titleImageView.frame.origin.x -= magnifierTitleXInset
            }
            
            self.addSubview(titleImageView)
            
            titleType = rootButton.titleType // default, we may use a different title type for th options than the root button

            //// ??? DELETE ???
            
    //        if (titleType == .Label) {
    //            titleLabel.isHidden = false
    //            titleImageView.isHidden = true
    //        } else if (displayType == .Image) {
    //            titleLabel.isHidden = true
    //            titleImageView.isHidden = false
    //        }
    //
    //        if (type == .Options) {
    //            titleLabel.isHidden = true
    //        }
        
        } else if (newType == .Options) {
            // nothing to do (?)
        }
        
        //NSLog("--- done initializing")
    }
    
    
    func setupAppearanceFromDevice() {
        //NSLog("MFKBDV.setupAppearanceFromDevice()")
        switch (UIDevice.current.userInterfaceIdiom) {
        case .phone:
            rootShadowColor = DEFAULT_IPHONE_SHADOW_COLOR // alpha 0.5
            rootShadowOffset = DEFAULT_IPHONE_ROOT_SHADOW_OFFSET // CGSize(width: 0.0, height: 0.5)
            detailShadowColor = DEFAULT_IPHONE_SHADOW_COLOR // alpha 0.5
            detailShadowOffset = DEFAULT_IPHONE_DETAIL_SHADOW_OFFSET // CGSize(width: 0.0, height: 0.5)
            break
        case .pad:
            rootShadowColor = DEFAULT_IPAD_SHADOW_COLOR // alpha 0.25
            rootShadowOffset = DEFAULT_IPAD_ROOT_SHADOW_OFFSET // .zero
            detailShadowColor = DEFAULT_IPAD_SHADOW_COLOR // alpha 0.25
            detailShadowOffset = DEFAULT_IPAD_DETAIL_SHADOW_OFFSET // .zero (?)
            break
        default:
            break
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateHighlightedInputIndex(forPoint point: CGPoint) -> () {
        
        var highlightedInputIndex: NSInteger = NSNotFound
        
        for optionRect in inputOptionsRects {
            if optionRect.contains(point) {
                highlightedInputIndex = inputOptionsRects.index(of: optionRect)!
            }
        }
        
        
//        //NSLog("MKFBDV.updateHighlightedInputIndex(forPoint:)")
//        var highlightedInputIndex: NSInteger = NSNotFound
//        //let testRect = CGRect(x: point.x, y: point.y, width: 0, height: 0)
//        //let location = convert(testRect, from: rootButton.superview).origin
//        let location = convert(point, from: rootButton.superview)
//
//        var nbKeysBefore: Int = 0
//
//        if (rootButton.optionsRowLengths.count > 1) {
//            //NSLog("--- rootButton.optionsRowLengths.count > 1")
//            // Find the row
//            let firstRect = (inputOptionsRects.first)!
//            var row = Int(location.y/firstRect.height) - 1
//            row = max(row, 0)
//            row = min(row, rootButton.optionsRowLengths.count)
//            ////NSLog(row.description)
//
//            // Extract keys of that row
//            for nbKeys in rootButton.optionsRowLengths[0..<row] { nbKeysBefore += nbKeys }
//            ////NSLog(nbKeysBefore.description)
//        }
//
//        // Find the key
//        //NSLog("--- find the selected key")
//        for keyRect: CGRect in inputOptionsRects.dropFirst(nbKeysBefore) {
//            var infiniteKeyRect = CGRect(x: keyRect.minX, y: 0.0, width: keyRect.width, height: CGFloat.infinity)
//            infiniteKeyRect = infiniteKeyRect.insetBy(dx: -OPTION_X_GAP/2.0, dy: 0)
//
//            if (infiniteKeyRect.contains(location)) {
//                highlightedInputIndex = (inputOptionsRects.index(of: keyRect))!
//                break
//            }
//        }
        
        if (self.highlightedInputIndex != highlightedInputIndex) {
            self.highlightedInputIndex = highlightedInputIndex
            setNeedsDisplay()
        }
    }
    
    
    override func didMoveToSuperview() {
        if (type == .Options) {
            determineOptionsGeometries()
        }
    }
    
    
    override func layoutSubviews() {
        //NSLog("MFKBDV.layoutSubviews()")
        super.layoutSubviews()
        
        //NSLog("--- layout image")
        // layout image
        var newFrame = titleImageView.frame
        titleImageView.frame = CGRect(x: newFrame.origin.x, y: newFrame.origin.y + cornerRadius, width: rootButton.frame.width * magnificationFactor, height: newFrame.size.height * magnificationFactor)
        titleImageView.center.x = rootButton.center.x
        
        // adjust position if magnifying on side of the screen
        if rootButton.optionsFanoutDirection == .Left {
            titleImageView.frame.origin.x -= magnifierTitleXInset
        } else if rootButton.optionsFanoutDirection == .Right {
            titleImageView.frame.origin.x += magnifierTitleXInset
        }
        
        //NSLog("--- layout label")
        // layout label
        titleLabel.center.x = rootButton.center.x
        newFrame = titleLabel.frame
        titleLabel.frame = CGRect(x: newFrame.origin.x, y: newFrame.origin.y + cornerRadius, width: rootButton.frame.width, height: rootButton.frame.height)
        titleLabel.center.x = rootButton.center.x
        
        // adjust position if magnifying on side of the screen
        if rootButton.position == .Left {
            titleLabel.frame.origin.x += magnifierTitleXInset
        } else if rootButton.position == .Right {
            titleLabel.frame.origin.x -= magnifierTitleXInset
        }
    }
    
    override func draw(_ rect: CGRect) {
        //NSLog("MFKBDV.draw(_)")
        switch type {
        case .Magnifier:
            drawMagnifiedInputView(rect)
        case .Options:
            drawOptionsView(rect)
        }
    }
    
    func drawMagnifiedInputView(_ rect: CGRect) {
        //NSLog("MFKBDV.drawMagnifiedInputView(_)")
        titleImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        titleImageView.contentMode = .center//scaleAspectFit
        // maybe use a larger image here, or enlarge the image by a function
        
        titleImageView.center = titleLabel.center
        
        if (rootButton.sizeClass == .Tablet) {
            //NSLog("Magnification not available on iPad!")
            return
        }
        
        // ok so we're on an iPhone as we should
            
        // Generate the overlay
        let bezierPath = magnifiedInputViewPath() // includes root button
        
        // Position the overlay
        let keyRect = convert(rootButton.frame, from: rootButton.superview)
            // root button in detail view's coords
        let context = UIGraphicsGetCurrentContext()
        
        // Draw the detail shadow (blurry), also around root button
        
        context?.saveGState()
        context?.setShadow(offset: detailShadowOffset, blur: CGFloat(detailShadowBlurRadius), color: detailShadowColor.cgColor)
        rootButton.color?.setFill()
        bezierPath.fill()
        context!.restoreGState()
        
        // Draw a white rounded rect over the tapped key, with a shadow
        // Draw the key shadow sliver (sharp), just around the root button
        
        let roundedRectanglePath = UIBezierPath.init(roundedRect: CGRect(x: keyRect.origin.x, y: keyRect.origin.y, width: keyRect.size.width, height: keyRect.size.height - rootShadowOffset.height), cornerRadius: cornerRadius) // cornerRadius was 4.0
        context?.saveGState()
        context?.setShadow(offset: rootShadowOffset, blur: CGFloat(rootShadowBlurRadius), color: rootShadowColor.cgColor)
        rootButton.color?.setFill()
        roundedRectanglePath.fill()
        context?.restoreGState()

        // should have been done earlier
        titleImageView.image = rootButton.titleImage
        
        titleLabel.text = rootButton.titleLabel.text
        titleLabel.clipsToBounds = false
        //titleLabel.sizeToFit()
        
        //// ??? DELETE ???
        if (rootButton.titleType == .Label) {
            titleLabel.isHidden = false
            titleImageView.isHidden = true
        } else if (rootButton.titleType == .Image) {
            titleLabel.isHidden = true
            titleImageView.isHidden = false
        }
        
    }
    
    
    func drawOptionsView(_ rect: CGRect) {
        //NSLog("MFKBDV.drawOptionsView(_)")
        // Generate the overlay
        let bezierPath = optionsViewPath()
        
        // Position the overlay
        let keyRect = convert(rootButton.frame, from: rootButton.superview)
        
        let context = UIGraphicsGetCurrentContext()
        
        //// ??? DELETE ???
//        // Overlay path & shadow
//
//        var shadowAlpha: CGFloat = 0.0
//        var shadowOffset = CGSize.zero
//
//
//        //// Shadow Declarations
//        let shadow = UIColor.black.withAlphaComponent(shadowAlpha)
//        let shadowBlurRadius: CGFloat = 2.0
        
        // draw a white background for the input options, with a blurry shadow
        // on an iPhone: including root button, painting over its title
        // on an iPad: without the root button
        context?.saveGState()
        context?.setShadow(offset: detailShadowOffset, blur: detailShadowBlurRadius, color: detailShadowColor.cgColor)
        rootButton.color?.setFill()
        bezierPath.fill()
        context?.restoreGState()
        
        
        // Draw the key shadow sliver (sharp), but only on an iPhone
        if (rootButton.sizeClass == .Phone) {

            let roundedRectanglePath = UIBezierPath.init(roundedRect: CGRect(x: keyRect.origin.x, y: keyRect.origin.y, width: keyRect.size.width, height: keyRect.size.height - 1.0), cornerRadius: cornerRadius) // cornerRadius was 4.0
            context?.saveGState()
            context?.setShadow(offset: rootShadowOffset, blur: rootShadowBlurRadius, color: rootShadowColor.cgColor)
            
            rootButton.color!.setFill()
            roundedRectanglePath.fill()
            context?.restoreGState()
        }
        
        drawOptionsView()
        
    }
    
    func drawOptionsView() {
        //NSLog("MFKBDV.drawOptionsView()")
        
        let context = UIGraphicsGetCurrentContext()
        context?.setShadow(offset: CGSize.zero, blur: 0, color: UIColor.clear.cgColor)
        context?.saveGState()
        
        
        // remove all previous image views (?)
        for subview: UIView in subviews {
            if let imageView: UIImageView = subview as? UIImageView {
                imageView.removeFromSuperview()
            }
        }
        
        
        for optionInputID: String in rootButton.optionsInputIDs {
            
            // position rect has already been computed, let's retrieve it
            let idx: NSInteger = rootButton.optionsInputIDs.index(of: optionInputID)!
            let optionRect: CGRect = inputOptionsRects[idx]
            let highlighted = (idx == highlightedInputIndex)
            
            if (highlighted) {
                // Draw selection background
                let roundedRectanglePath = UIBezierPath(roundedRect: optionRect, cornerRadius: cornerRadius)
                    // cornerRadius was 4.0
                tintColor.setFill()
                roundedRectanglePath.fill()
            }
            
            if (titleType == .Label) {
                
                if rootButton.optionsTitles.count > 0 {
            
                    let optionTitle = rootButton.optionsTitles[idx]
                
//                    // Draw the text
                    let stringColor = highlighted ? UIColor.white : rootButton.titleColor
                    
                    //NSLog(idx.description)
                    //NSLog(highlightedInputIndex.description)
                    //NSLog(highlighted.description)
                    //NSLog(stringColor!.description)
                    //NSLog("===========================")
                    
//                    let p = NSMutableParagraphStyle()
//                    p.alignment = NSTextAlignment.center
//                    let stringSize = (optionTitle as NSString).size(attributes: ["font": rootButton.optionsFont, "foregroundColor": stringColor!, "paragraphStyle": p])
//                    let stringRect = CGRect(x: optionRect.midX - stringSize.width * 0.5, y: optionRect.midY - stringSize.height * 0.5, width: stringSize.width, height: stringSize.height)
                    
//                    let attributedString = NSMutableAttributedString.init(string: optionTitle, attributes: ["font": rootButton.optionsFont, "strokeColor": UIColor.red, "paragraphStyle": p, "backgroundColor": UIColor.red])
//                    let range = NSMakeRange(0, attributedString.length)
//                    attributedString.removeAttribute("font", range: range)
//                    attributedString.addAttributes(["font": UIFont.systemFont(ofSize: 24.0)], range: range)
//                    attributedString.draw(in: stringRect)
                    
                    let newLabel = UILabel(frame: optionRect)
                    newLabel.text = optionTitle
                    newLabel.textColor = stringColor
                    newLabel.font = rootButton.optionsFont
                    newLabel.contentMode = .scaleAspectFit
                    newLabel.clipsToBounds = false
                    //newLabel.sizeToFit()
                    newLabel.textAlignment = .center
                    newLabel.center = CGPoint(x: optionRect.midX, y: optionRect.midY)
                    addSubview(newLabel)
                    newLabel.adjustsFontSizeToFitWidth = true
                
                }
            
            } else if (titleType == .Image) {
                
                if rootButton.optionsImages.count > 0 {
                    
                    // Draw an image
                    let imageView = UIImageView(frame: optionRect)
                    if highlighted {
                        imageView.image = rootButton.highlightedOptionsImages[idx]
                    } else {
                        imageView.image = rootButton.optionsImages[idx]
                    }
                    self.addSubview(imageView)
                    
                }
                
            } // end of .Label, .Image cases
            
        } // end of loop over optionIDs
        
        context?.restoreGState()
    }
    
    
    
    
    
    func magnifiedInputViewPath() -> UIBezierPath {
        //NSLog("MFKBDV.magnifiedInputViewPath()")
        
        // draw out the shape of the root button with magnification (iPhone only)
        
        let keyRect = convert(rootButton.frame, from: rootButton.superview)
        let insets = UIEdgeInsets(top:    magnifierEdgeInsetY,
                                  left:   magnifierEdgeInsetX,
                                  bottom: magnifierEdgeInsetY,
                                  right:  magnifierEdgeInsetX)
        let upperWidth = rootButton.frame.width + insets.left + insets.right
        let lowerWidth = rootButton.frame.width

        let path = TurtleBezierPath()
        path.home()
        path.lineWidth = 0.0
        path.lineCapStyle = CGLineCap.round

        switch rootButton.position {
            
        case .Inner:
            //NSLog("--- .Inner")
            path.rightArc(detailMajorRadius, turn: 90.0) // #1
            path.forward(upperWidth - 2.0 * detailMajorRadius) // #2 top
            path.rightArc(detailMajorRadius, turn: 90.0) // #3
            path.forward(keyRect.height + insets.top + insets.bottom - 2.0 * detailMajorRadius) // #4 right big
            path.rightArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_INNER) // #5
            path.forward(DETAIL_DIAGONAL_LENGTH)
            //path.forward(upperWidth - majorRadius - lowerWidth/2.0)
            path.leftArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_INNER) // #6
            path.forward(keyRect.height - DETAIL_LOWER_SUBTRACTED_HEIGHT)
            path.rightArc(detailMinorRadius, turn: 90.0)
            path.forward(lowerWidth - 2.0 * detailMinorRadius) // lowerWidth - 2.0 * minorRadius + 0.5
            path.rightArc(detailMinorRadius, turn: 90.0)
            path.forward(keyRect.height - 2 * detailMinorRadius)
            path.leftArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_INNER)
            path.forward(DETAIL_DIAGONAL_LENGTH)
            //path.forward(upperWidth - majorRadius - lowerWidth/2.0)
            path.rightArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_INNER)
            
            var offsetX: CGFloat = 0.0
            var offsetY: CGFloat = 0.0
            let pathBoundingBox = path.bounds
            
            offsetX = keyRect.midX - path.bounds.midX
            offsetY = keyRect.maxY - pathBoundingBox.height + IPHONE_DETAIL_INNER_OFFSET_Y_PADDING
            
            path.apply(CGAffineTransform(translationX: offsetX, y: offsetY))
            
            break
            
            
        case .Right:
            //NSLog("--- .Left")
            path.rightArc(detailMajorRadius, turn: 90.0) // #1
            path.forward(upperWidth - 2.0 * detailMajorRadius) // #2 top
            path.rightArc(detailMajorRadius, turn: 90.0) // #3
            path.forward(keyRect.height + insets.top + insets.bottom - 2.0 * detailMajorRadius) // #4 right big
            path.rightArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_OUTER) // #5
            path.forward(28.0) // #6
            path.leftArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_OUTER) // #7
            //path.forward(keyRect.height - 26.0 + (insets.left + insets.right) * 0.25) // #8
            path.forward(keyRect.height - 2.0 * magnifierEdgeInsetY + (insets.left + insets.right) * 0.25) // #8
            path.rightArc(detailMinorRadius, turn: 90.0) // #9
            path.forward(path.currentPoint.x - detailMinorRadius) // #10
            path.rightArc(detailMinorRadius, turn: 90.0) // #11
            
            var offsetX: CGFloat = 0.0
            var offsetY: CGFloat = 0.0
            let pathBoundingBox = path.bounds
            
            offsetX = keyRect.maxX - path.bounds.width
            offsetY = keyRect.maxY - pathBoundingBox.height - path.bounds.minY
            
            path.apply(CGAffineTransform(scaleX: -1.0, y: 1.0).translatedBy(x: -offsetX - path.bounds.width, y: offsetY))
            
            break
            
            
        case .Left:
            //NSLog("--- .Right")
            path.rightArc(detailMajorRadius, turn: 90.0) // #1
            path.forward(upperWidth - 2.0 * detailMajorRadius) // #2
            path.rightArc(detailMajorRadius, turn: 90.0) // #3
            path.forward(keyRect.height + insets.top + insets.bottom - 2.0 * detailMajorRadius) // #4 right big
            path.rightArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_OUTER) // #5
            path.forward(28.0) // #6
            path.leftArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_OUTER) // #7
            path.forward(keyRect.height - 2.0 * magnifierEdgeInsetY + (insets.left + insets.right) * 0.25) // #8
            path.rightArc(detailMinorRadius, turn: 90.0) // #9
            path.forward(path.currentPoint.x - detailMinorRadius) // #10
            path.rightArc(detailMinorRadius, turn: 90.0) // #11
            
            var offsetX: CGFloat = 0.0
            var offsetY: CGFloat = 0.0
            let pathBoundingBox = path.bounds
            
            offsetX = keyRect.minX
            offsetY = keyRect.maxY - pathBoundingBox.height - path.bounds.minY
            
            path.apply(CGAffineTransform(translationX: offsetX, y: offsetY))
            
            break
            
        }
        
        return path
        
    }
    
    
    func optionsViewPath() -> UIBezierPath {
        //NSLog("MFKBDV.optionsViewPath()")
        var keyRect = convert(rootButton.frame, from: rootButton.superview)
        keyRect.size.width = rootButton.optionWidth
        keyRect.size.height = rootButton.optionHeight

        let insets = UIEdgeInsets(top:    magnifierEdgeInsetY,
                                  left:   magnifierEdgeInsetX,
                                  bottom: magnifierEdgeInsetY,
                                  right:  magnifierEdgeInsetX)
        
        let nbKeys = rootButton.optionsRowLengths.max()
        let nbRows = rootButton.optionsRowLengths.count
        
        let upperWidth = insets.left + insets.right + CGFloat(nbKeys!) * (keyRect.width + OPTION_MARGIN) - 2.0 * OPTION_MARGIN
        //upperWidth +=  - OPTION_MARGIN * 0.5
        let lowerWidth = rootButton.frame.width
        
        var offsetX: CGFloat = 0.0
        var offsetY: CGFloat = 0.0
        
        switch rootButton.optionsFanoutDirection {
            
        case .Right:
            //NSLog("--- .Right")
            switch rootButton.sizeClass {
            case .Phone:
                //NSLog("--- --- .Phone")
                let path = TurtleBezierPath()
                path.home()
                
                path.lineWidth = 0.0
                path.lineCapStyle = CGLineCap.round
                path.rightArc(detailMajorRadius, turn: 90.0) // #1
                path.forward(upperWidth - 2.0 * detailMajorRadius) // #2 top
                path.rightArc(detailMajorRadius, turn: 90.0) // #3
                path.forward(CGFloat(nbRows) * keyRect.height + insets.top + insets.bottom - 2.0 * detailMajorRadius + OPTION_HEIGHT_PADDING) // #4 right big
                path.rightArc(detailMajorRadius, turn: 90.0) // #5
                //path.forward(path.currentPoint.x - (keyRect.width + 2.0 * detailMajorRadius + 3.0))
                path.forward(upperWidth - lowerWidth - 2.0 * detailMajorRadius - DETAIL_DIAGONAL_LENGTH * sin(DETAIL_TURN_ANGLE_INNER * 3.14159 / 180.0) - 2.0 * detailMajorRadius * (1.0 - cos(DETAIL_TURN_ANGLE_INNER * 3.14159 / 180.0)))
                path.leftArc(detailMajorRadius, turn: 90.0) // #6
                path.forward(keyRect.height - detailMinorRadius)
                path.rightArc(detailMinorRadius, turn: 90.0)
                path.forward(lowerWidth - 2.0 * detailMinorRadius) //  lowerWidth - 2 * minorRadius + 0.5
                path.rightArc(detailMinorRadius, turn: 90.0)
                path.forward(keyRect.height - 2.0 * detailMinorRadius)
                path.leftArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_INNER)
                path.forward(DETAIL_DIAGONAL_LENGTH)
                path.rightArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_INNER)
                
                offsetX = keyRect.maxX - keyRect.width - insets.left
                offsetY = keyRect.maxY - path.bounds.height + IPHONE_DETAIL_INNER_OFFSET_Y_PADDING
                
                
                
                path.apply(CGAffineTransform(translationX: offsetX, y: offsetY))
                
                return path
                
                
            case .Tablet:
                
                //NSLog("--- --- .Tablet")
                let firstRect = inputOptionsRects[0]
                
                let path = UIBezierPath(roundedRect: CGRect(x: 0.0, y: 0.0, width: upperWidth, height: CGFloat(nbRows) * firstRect.height + IPAD_OPTIONS_HEIGHT_PADDING), cornerRadius: cornerRadius)
                
                path.lineWidth = 0.0
                path.lineCapStyle = CGLineCap.round
                
                offsetX = keyRect.minX
                offsetY = firstRect.minY + IPAD_DETAIL_INNER_OFFSET_Y_PADDING
                
                path.apply(CGAffineTransform(translationX: offsetX, y: offsetY))
                
                return path
            }
            
        case .Left:
            //NSLog("--- .Left")
            switch rootButton.sizeClass {
            case .Phone:
                
                //NSLog("--- --- .Phone")
                let path = TurtleBezierPath()
                path.home()
                
                path.lineWidth = 0.0
                path.lineCapStyle = CGLineCap.round
                
                path.rightArc(detailMajorRadius, turn: 90.0) // #1
                path.forward(upperWidth - 2.0 * detailMajorRadius) // #2 top
                path.rightArc(detailMajorRadius, turn: 90.0) // #3
                path.forward(CGFloat(nbRows) * keyRect.height + insets.top + insets.bottom - 2.0 * detailMajorRadius + OPTION_HEIGHT_PADDING) // #4 right big
                path.rightArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_INNER)
                path.forward(DETAIL_DIAGONAL_LENGTH)
                path.leftArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_INNER)
                path.forward(keyRect.height - detailMinorRadius)
                path.rightArc(detailMinorRadius, turn: 90.0)
                path.forward(lowerWidth - 2.0 * detailMinorRadius) //  lowerWidth - 2 * minorRadius + 0.5
                path.rightArc(detailMinorRadius, turn: 90.0)
                path.forward(keyRect.height - 2.0 * detailMinorRadius)
                path.leftArc(detailMajorRadius, turn: 90.0) // #5
                //path.forward(path.currentPoint.x - detailMajorRadius)
                let x = upperWidth - lowerWidth - 2.0 * detailMajorRadius - DETAIL_DIAGONAL_LENGTH * sin(DETAIL_TURN_ANGLE_INNER * 3.14159 / 180.0) - 2.0 * detailMajorRadius * (1.0 - cos(DETAIL_TURN_ANGLE_INNER * 3.14159 / 180.0))
                path.forward(x)
                path.rightArc(detailMajorRadius, turn: 90.0) // #6
                
                offsetX = keyRect.minX - x - 2.0 * detailMajorRadius // keyRect.maxX + keyRect.width - path.bounds.width -  insets.left
                offsetY = keyRect.maxY - path.bounds.height + IPHONE_DETAIL_INNER_OFFSET_Y_PADDING
                
                path.apply(CGAffineTransform(translationX: offsetX, y: offsetY))
                
                return path
                
            case .Tablet:
                //NSLog("--- --- .Tablet")
                let firstRect = inputOptionsRects[0]
                
                let path = UIBezierPath(roundedRect: CGRect(x: 0.0, y: 0.0, width: upperWidth, height: CGFloat(nbRows) * firstRect.height + IPAD_OPTIONS_HEIGHT_PADDING), cornerRadius: cornerRadius)
                
                path.lineWidth = 0.0
                path.lineCapStyle = CGLineCap.round
                
                offsetX = keyRect.minX - path.bounds.width + rootButton.frame.width - 2.0 * detailMajorRadius
                offsetY = firstRect.minY + IPAD_DETAIL_INNER_OFFSET_Y_PADDING
                
                path.apply(CGAffineTransform(translationX: offsetX, y: offsetY))
                
                return path
                
            }
            
        }
        
    }
    
  
    
    
    func determineOptionsGeometries() {
        
        //NSLog("MFKBDV.determineOptionsGeometries()")
        var keyRect = convert(rootButton.frame, from: rootButton.superview)
        //keyRect = CGRect(x: keyRect.origin.x, y: keyRect.origin.y, width: (button?.optionsRectWidth)!, height: keyRect.size.height)
        keyRect.size.width = rootButton.optionWidth
        keyRect.size.height = rootButton.optionHeight
        
        
        var newInputOptionsRects = Array<CGRect>()
        //newInputOptionsRects.reserveCapacity(rootButton.optionsInputIDs.count)
        
        //let nbKeys: Int = (button?.optionsRowLengths.max())!
        let nbRows = rootButton.optionsRowLengths.count
        var offset: CGFloat = 0.0
        
        var optionRect = CGRect.zero
        var rowLeadingOptionRect = CGRect.zero
        
        switch rootButton.sizeClass {
        case .Phone:
            //NSLog("--- .Phone")
            offset = keyRect.width
            optionRect = keyRect.insetBy(dx: OPTION_RECT_X_INSET, dy: OPTION_RECT_Y_INSET).offsetBy(dx: rootButton.optionsRowOffsets.first!, dy: -(CGFloat(nbRows) * keyRect.height + OPTION_RECT_Y_OFFSET_PADDING))
            break

        case .Tablet:
            //NSLog("--- .Tablet")
            offset = keyRect.width
            //optionRect = keyRect.insetBy(dx: 6.0, dy: 6.5).offsetBy(dx: (button?.optionsRowOffsets.first!)!, dy: -(CGFloat(nbRows) * keyRect.height + 25.0))
            optionRect = keyRect.insetBy(dx: OPTION_RECT_X_INSET, dy: OPTION_RECT_Y_INSET).offsetBy(dx: rootButton.optionsRowOffsets.first! + rootButton.cornerRadius, dy: -(CGFloat(nbRows) * keyRect.height + OPTION_RECT_Y_OFFSET_PADDING))

            break
        }
    
        rowLeadingOptionRect = optionRect
    
        var rowCounter: Int = 0
        var keyCounter: Int = 0
        
        for _ in rootButton.optionsInputIDs {
            
            newInputOptionsRects.append(optionRect)
            
            // Offset the option rect
            switch rootButton.optionsFanoutDirection {
            case .Right:
                optionRect = optionRect.offsetBy(dx: offset + OPTION_X_GAP, dy: 0.0)
                break
            case .Left:
                optionRect = optionRect.offsetBy(dx: -offset - OPTION_X_GAP, dy: 0.0)
                break
            }
            
            keyCounter += 1
            if keyCounter == rootButton.optionsRowLengths[rowCounter] {
                
                keyCounter = 0
                rowCounter += 1

                if (rowCounter < nbRows) {
                    rowLeadingOptionRect = rowLeadingOptionRect.offsetBy(dx: 0.0, dy: keyRect.height) // + spacing)
                    let offsetDirection: CGFloat = rootButton.optionsFanoutDirection == .Right ? 1.0 : -1.0
                    optionRect = rowLeadingOptionRect.offsetBy(dx: rootButton.optionsRowOffsets[rowCounter] * keyRect.width * offsetDirection, dy: 0.0)
                }
                
            }
            
        }
        
        inputOptionsRects = newInputOptionsRects
        
    }
    
    
}






















































