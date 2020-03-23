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
let DEFAULT_IPHONE_ROOT_SHADOW_OFFSET = CGSize(width: 0.1, height: 0.7)
let DEFAULT_IPHONE_SHADOW_BLUR_RADIUS: CGFloat = 0.0
let DEFAULT_IPHONE_DETAIL_SHADOW_OFFSET = CGSize(width: 0, height: 0.5)
let DEFAULT_IPHONE_DETAIL_SHADOW_BLUR_RADIUS: CGFloat = 2.0

let DEFAULT_IPAD_SHADOW_COLOR = UIColor.black.withAlphaComponent(0.5)
let DEFAULT_IPAD_ROOT_SHADOW_OFFSET = CGSize(width: 0.1, height: 0.7)
let DEFAULT_IPAD_SHADOW_BLUR_RADIUS: CGFloat = 0.0
let DEFAULT_IPAD_DETAIL_SHADOW_OFFSET = CGSize(width: 0, height: 0.5)
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
    var previouslyHighlightedInputIndex: NSInteger = NSNotFound
    
    
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
        
        var frame = UIScreen.main.bounds
        let maxDimension: CGFloat = max(frame.width, frame.height)
        frame = CGRect(x: 0, y: 0, width: maxDimension, height: maxDimension)
        // this is a workaround since device orientation cannot be detected here, bc of reasons
        
        type = newType
        highlightedInputIndex = NSNotFound
        
        rootButton = keyboardButton
        
        cornerRadius = rootButton.cornerRadius
        rootShadowColor = rootButton.color!
        
        
        super.init(frame: frame)
        
        
        setupAppearanceFromDevice()
        
        backgroundColor = .clear
        isUserInteractionEnabled = false
        
        // If this is a magnifier, setup the title label or image
        
        if (newType == .Magnifier) {
            
            // Label
            titleLabel.frame = magnifiedInputViewPath().bounds
            titleLabel.text = rootButton.titleLabel.text ?? rootButton.inputID
            titleLabel.font = rootButton.magnifierTitleLabelFont //  titleLabelFont // button?.titleLabel.font //.withSize(44.0)
            titleLabel.textColor = rootButton.titleColor
            titleLabel.backgroundColor = .clear
            titleLabel.textAlignment = .center
            titleLabel.clipsToBounds = false
            titleLabel.contentMode = .center
            titleLabel.adjustsFontSizeToFitWidth = true
            
            if rootButton.position == .Left {
                titleLabel.frame.origin.x += magnifierTitleXInset
            } else if rootButton.position == .Right {
                titleLabel.frame.origin.x -= magnifierTitleXInset
            }
            
            self.addSubview(titleLabel)
            
            // Image
            let newFrame = magnifiedInputViewPath().bounds
            titleImageView.frame = CGRect(x: newFrame.origin.x, y: newFrame.origin.y, width: newFrame.size.width, height: rootButton.frame.size.height)
            titleImageView.backgroundColor = .clear
            titleImageView.image = UIImage()
            titleImageView.autoresizingMask = []

            if rootButton.position == .Left {
                titleImageView.frame.origin.x += magnifierTitleXInset
            } else if rootButton.position == .Right {
                titleImageView.frame.origin.x -= magnifierTitleXInset
            }
            
            self.addSubview(titleImageView)
            
            titleType = rootButton.titleType // default, we may use a different title type for th options than the root button

        
        } else if (newType == .Options) {
            // nothing to do (?)
        }
        
    }
    

    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first!.location(in: self)
        updateHighlightedInputIndex(forPoint: point)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first!.location(in: self)
        updateHighlightedInputIndex(forPoint: point)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first!.location(in: self)
        updateHighlightedInputIndex(forPoint: point)
        
        if (!optionsViewPath().contains(point) || rootButton.frame.contains(point)) {
            // tapped outside or on root button (white): dismiss popup
            highlightedInputIndex = NSNotFound
            rootButton.hideOptions()
            return
        }
        
        if (optionsViewPath().contains(point) && (highlightedInputIndex >= rootButton.optionsInputIDs.count || highlightedInputIndex < 0)) {
            // tapped inside on whitespace
            highlightedInputIndex = NSNotFound
//            if !rootButton.optionsArePersistent {
//                rootButton.hideOptions()
//            }
            return
        }
        
        // tapped on an option
        let optionalTappedInputID: String? = rootButton.optionsInputIDs[highlightedInputIndex]
        if let tappedInputID = optionalTappedInputID
        {
            rootButton.delegate?.handleKeyboardEvent(tappedInputID, save: true)
            rootButton.delegate?.log("touchesEnded")
            rootButton.updateTitle(tappedInputID)
        }
        
        
        for subview in subviews {
            if let label = subview as? UILabel {
                label.backgroundColor = rootButton.color
            } else if let imageView = subview as? UIImageView {
                imageView.backgroundColor = rootButton.color
            }
        }
        
        previouslyHighlightedInputIndex = highlightedInputIndex
        highlightedInputIndex = NSNotFound
        drawInputOptionView(for: previouslyHighlightedInputIndex)
        drawInputOptionView(for: highlightedInputIndex)
    }
    
    
    func setupAppearanceFromDevice() {
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
                let index = inputOptionsRects.index(of: optionRect)
                if index == nil {
                } else if index == NSNotFound {
                } else {
                    highlightedInputIndex = index!
                }
            }
        }
        
        if (self.highlightedInputIndex != highlightedInputIndex) {
            self.previouslyHighlightedInputIndex = self.highlightedInputIndex
            self.highlightedInputIndex = highlightedInputIndex
            drawInputOptionView(for: self.previouslyHighlightedInputIndex)
            drawInputOptionView(for: self.highlightedInputIndex)
            
        }
    }
    
    
    override func didMoveToSuperview() {
        if (type == .Options) {
            determineOptionsGeometries()
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
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
        
        // layout label
        titleLabel.center.x = rootButton.center.x
        newFrame = titleLabel.frame
        titleLabel.frame = CGRect(x: newFrame.origin.x, y: newFrame.origin.y + cornerRadius, width: rootButton.frame.width, height: rootButton.frame.height)
        titleLabel.center.x = rootButton.center.x
        
        // adjust position if magnifying next to a screen edge
        if rootButton.position == .Left {
            titleLabel.frame.origin.x += magnifierTitleXInset
        } else if rootButton.position == .Right {
            titleLabel.frame.origin.x -= magnifierTitleXInset
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        isUserInteractionEnabled = true
        
        switch type {
        case .Magnifier:
            drawMagnifiedInputView(rect)
        case .Options:
            drawOptionsView(rect)
        }
    }
    
    
    func drawMagnifiedInputView(_ rect: CGRect) {
        titleImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        titleImageView.contentMode = .center
        // maybe use a larger image here, or enlarge the image by a function
        
        titleImageView.center = titleLabel.center
        
        if (rootButton.sizeClass == .Tablet) {
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
        
        layer.shadowPath = bezierPath.cgPath
        layer.shadowRadius = detailShadowBlurRadius
        layer.shadowColor = detailShadowColor.cgColor
        layer.shadowOpacity = 1.0 // ?
        layer.shadowOffset = detailShadowOffset
        
        context?.saveGState()
        rootButton.color?.setFill()
        bezierPath.fill()
        context?.restoreGState()
        
        // Draw a white rounded rect over the tapped key, with a shadow
        // Draw the key shadow sliver (sharp), just around the root button
        
        let roundedRectanglePath = UIBezierPath.init(roundedRect: CGRect(x: keyRect.origin.x, y: keyRect.origin.y, width: keyRect.size.width, height: keyRect.size.height - rootShadowOffset.height), cornerRadius: cornerRadius) // cornerRadius was 4.0
        context?.saveGState()
        rootButton.color?.setFill()
        roundedRectanglePath.fill()
        context?.restoreGState()

        // should have been done earlier
        titleImageView.image = rootButton.titleImage
        
        titleLabel.text = rootButton.titleLabel.text
        titleLabel.clipsToBounds = false
        
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
        // Generate the overlay
        let bezierPath = optionsViewPath()
        
        layer.shadowPath = bezierPath.cgPath
        layer.shadowRadius = detailShadowBlurRadius
        layer.shadowColor = detailShadowColor.cgColor
        layer.shadowOpacity = 1.0 // ?
        layer.shadowOffset = detailShadowOffset
        
        // Position the overlay
        let keyRect = convert(rootButton.frame, from: rootButton.superview)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setShouldAntialias(false)

        // draw a white background for the input options, with a blurry shadow
        // on an iPhone: including root button, painting over its title
        // on an iPad: without the root button


        context?.saveGState()
        rootButton.color?.setFill()
        bezierPath.fill()
        context?.restoreGState()


        // Draw the key shadow sliver (sharp), but only on an iPhone
        if (rootButton.sizeClass == .Phone) {

            let roundedRectanglePath = UIBezierPath.init(roundedRect: CGRect(x: keyRect.origin.x, y: keyRect.origin.y, width: keyRect.size.width, height: keyRect.size.height - 1.0), cornerRadius: cornerRadius) // cornerRadius was 4.0
            context?.saveGState()
            rootButton.color?.setFill()
            roundedRectanglePath.fill()
            context?.restoreGState()
        }

        context?.saveGState()
        
        // remove all previous image views
        for subview: UIView in subviews {
            if let imageView: UIImageView = subview as? UIImageView {
                imageView.removeFromSuperview()
            }
        }
        
        
        for optionInputID: String in rootButton.optionsInputIDs {
            // position rect has already been computed, let's retrieve it
            let idx = rootButton.optionsInputIDs.index(of: optionInputID)!
            if rootButton.titleType == .Label {
                setupLabel(for: idx)
            } else if titleType == .Image {
                setupImageView(for: idx)
            }
            
        }
        
        context?.restoreGState()
    }
    
    func setupLabel(for idx: NSInteger) {
        let optionTitle = rootButton.optionsTitles[idx]
        let optionRect: CGRect = inputOptionsRects[idx]
        let stringColor = rootButton.titleColor
        
        let newLabel = UILabel(frame: optionRect)
        newLabel.text = optionTitle
        newLabel.textColor = stringColor
        newLabel.font = rootButton.optionsFont
        newLabel.contentMode = .center
        newLabel.clipsToBounds = false
        newLabel.textAlignment = .center
        newLabel.center = CGPoint(x: optionRect.midX, y: optionRect.midY)
        newLabel.isOpaque = true
        addSubview(newLabel)
        newLabel.adjustsFontSizeToFitWidth = true
        newLabel.layer.cornerRadius = 5.0
        newLabel.layer.masksToBounds = true
        
    }
    
    func setupImageView(for idx: NSInteger) {
        let optionRect: CGRect = inputOptionsRects[idx]
        
        let newImageView = UIImageView(frame: optionRect)
        
        if #available(iOS 13, *) {
            if (traitCollection.userInterfaceStyle == .dark && !rootButton.inputID.starts(with: "copy")) {
                rootButton.delegate?.log("should use highlighted image")
                newImageView.image = rootButton.optionsImages[idx].inverted()!
            } else {
                newImageView.image = rootButton.optionsImages[idx]
            }
        } else {
            newImageView.image = rootButton.optionsImages[idx]
        }
        
        newImageView.contentMode = .center
        newImageView.clipsToBounds = false
        newImageView.center = CGPoint(x: optionRect.midX, y: optionRect.midY)
        newImageView.isOpaque = true
        addSubview(newImageView)
        newImageView.layer.cornerRadius = 5.0
        newImageView.layer.masksToBounds = true
        
    }
    
    func drawInputOptionView(for idx: NSInteger) {
        
        if (idx == NSNotFound || idx >= inputOptionsRects.count) {
            return
        }
        
        let optionTitle = rootButton.optionsTitles[idx]
        let highlighted = (idx == self.highlightedInputIndex)
        let previouslyHighlighted = (idx == self.previouslyHighlightedInputIndex)
        rootButton.delegate?.log("we are here")
        
        for subview: UIView in subviews {
            if let label = subview as? UILabel {
                if label.text == optionTitle {
                    if highlighted {
                        label.backgroundColor = rootButton.optionHighlightColor // .tintColor
                        label.textColor = .white
                    } else if previouslyHighlighted {
                        label.backgroundColor = rootButton.color
                        label.textColor = rootButton.titleLabel.textColor
                    }
                }
            } else if let imageView = subview as? UIImageView {
                
                if (imageView.image == rootButton.optionsImages[idx] || imageView.image == rootButton.highlightedOptionsImages[idx]) {
                    rootButton.delegate?.log("we are here")
                    if highlighted {
                        imageView.backgroundColor = rootButton.optionHighlightColor
                        imageView.image = rootButton.highlightedOptionsImages[idx]
                    } else if previouslyHighlighted {
                        imageView.backgroundColor = rootButton.color
                        imageView.image = rootButton.optionsImages[idx]
                    }
                    imageView.contentMode = .center
                    
                }
    
            }
            
        }
        
    }
    
    
    
    func magnifiedInputViewPath() -> UIBezierPath {
        
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
            path.rightArc(detailMajorRadius, turn: 90.0) // #1
            path.forward(upperWidth - 2.0 * detailMajorRadius) // #2 top
            path.rightArc(detailMajorRadius, turn: 90.0) // #3
            path.forward(keyRect.height + insets.top + insets.bottom - 2.0 * detailMajorRadius) // #4 right big
            path.rightArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_INNER) // #5
            path.forward(DETAIL_DIAGONAL_LENGTH)
            path.leftArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_INNER) // #6
            path.forward(keyRect.height - DETAIL_LOWER_SUBTRACTED_HEIGHT)
            path.rightArc(detailMinorRadius, turn: 90.0)
            path.forward(lowerWidth - 2.0 * detailMinorRadius) // lowerWidth - 2.0 * minorRadius + 0.5
            path.rightArc(detailMinorRadius, turn: 90.0)
            path.forward(keyRect.height - 2 * detailMinorRadius)
            path.leftArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_INNER)
            path.forward(DETAIL_DIAGONAL_LENGTH)
            path.rightArc(detailMajorRadius, turn: DETAIL_TURN_ANGLE_INNER)
            
            var offsetX: CGFloat = 0.0
            var offsetY: CGFloat = 0.0
            let pathBoundingBox = path.bounds
            
            offsetX = keyRect.midX - path.bounds.midX
            offsetY = keyRect.maxY - pathBoundingBox.height + IPHONE_DETAIL_INNER_OFFSET_Y_PADDING
            
            path.apply(CGAffineTransform(translationX: offsetX, y: offsetY))
            
            break
            
            
        case .Right:
            path.rightArc(detailMajorRadius, turn: 90.0) // #1
            path.forward(upperWidth - 2.0 * detailMajorRadius) // #2 top
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
            
            offsetX = keyRect.maxX - path.bounds.width
            offsetY = keyRect.maxY - pathBoundingBox.height - path.bounds.minY
            
            path.apply(CGAffineTransform(scaleX: -1.0, y: 1.0).translatedBy(x: -offsetX - path.bounds.width, y: offsetY))
            
            break
            
            
        case .Left:
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
        let lowerWidth = rootButton.frame.width
        
        var offsetX: CGFloat = 0.0
        var offsetY: CGFloat = 0.0
        
        switch rootButton.optionsFanoutDirection {
            
        case .Right:
            switch rootButton.sizeClass {
            case .Phone:
                let path = TurtleBezierPath()
                path.home()
                
                path.lineWidth = 0.0
                path.lineCapStyle = CGLineCap.round
                path.rightArc(detailMajorRadius, turn: 90.0) // #1
                path.forward(upperWidth - 2.0 * detailMajorRadius) // #2 top
                path.rightArc(detailMajorRadius, turn: 90.0) // #3
                path.forward(CGFloat(nbRows) * keyRect.height + insets.top + insets.bottom - 2.0 * detailMajorRadius + OPTION_HEIGHT_PADDING) // #4 right big
                path.rightArc(detailMajorRadius, turn: 90.0) // #5
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
                
                let firstRect = inputOptionsRects[0]
                let path = UIBezierPath(roundedRect: CGRect(x: 0.0, y: 0.0, width: upperWidth, height: CGFloat(nbRows) * firstRect.height + IPAD_OPTIONS_HEIGHT_PADDING), cornerRadius: cornerRadius)
                
                path.lineWidth = 0.0
                path.lineCapStyle = CGLineCap.round
                
                offsetX = keyRect.minX - detailMajorRadius
                offsetY = firstRect.minY + IPAD_DETAIL_INNER_OFFSET_Y_PADDING
                
                path.apply(CGAffineTransform(translationX: offsetX, y: offsetY))
                return path
            }
            
        case .Left:
            switch rootButton.sizeClass {
            case .Phone:
                
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
                let x = upperWidth - lowerWidth - 2.0 * detailMajorRadius - DETAIL_DIAGONAL_LENGTH * sin(DETAIL_TURN_ANGLE_INNER * 3.14159 / 180.0) - 2.0 * detailMajorRadius * (1.0 - cos(DETAIL_TURN_ANGLE_INNER * 3.14159 / 180.0))
                path.forward(x)
                path.rightArc(detailMajorRadius, turn: 90.0) // #6
                
                offsetX = keyRect.minX - x - 2.0 * detailMajorRadius // keyRect.maxX + keyRect.width - path.bounds.width -  insets.left
                offsetY = keyRect.maxY - path.bounds.height + IPHONE_DETAIL_INNER_OFFSET_Y_PADDING
                
                path.apply(CGAffineTransform(translationX: offsetX, y: offsetY))
                
                return path
                
            case .Tablet:
                let firstRect = inputOptionsRects[0]
                
                let path = UIBezierPath(roundedRect: CGRect(x: 0.0, y: 0.0, width: upperWidth, height: CGFloat(nbRows) * firstRect.height + IPAD_OPTIONS_HEIGHT_PADDING), cornerRadius: cornerRadius)
                
                path.lineWidth = 0.0
                path.lineCapStyle = CGLineCap.round
                
                var optionRect = CGRect.zero
                
                switch rootButton.sizeClass {
                case .Phone:
                    optionRect = keyRect.insetBy(dx: OPTION_RECT_X_INSET, dy: OPTION_RECT_Y_INSET).offsetBy(dx: rootButton.optionsRowOffsets.first!, dy: -(CGFloat(nbRows) * keyRect.height + OPTION_RECT_Y_OFFSET_PADDING))
                    break
                    
                case .Tablet:
                    optionRect = keyRect.insetBy(dx: OPTION_RECT_X_INSET, dy: OPTION_RECT_Y_INSET).offsetBy(dx: 0.0, dy: -(CGFloat(nbRows) * keyRect.height + OPTION_RECT_Y_OFFSET_PADDING))
                    
                    break
                }
                
                 let translateX = optionRect.maxX - upperWidth + detailMajorRadius
                let translateY = firstRect.minY + IPAD_DETAIL_INNER_OFFSET_Y_PADDING
                
                path.apply(CGAffineTransform(translationX: translateX, y: translateY))
                
                return path
                
            }
            
        }
        
    }
    
  
    
    
    func determineOptionsGeometries() {
        
        var keyRect = convert(rootButton.frame, from: rootButton.superview)
        keyRect.size.width = rootButton.optionWidth
        keyRect.size.height = rootButton.optionHeight
        
        var newInputOptionsRects = Array<CGRect>()
        let nbRows = rootButton.optionsRowLengths.count
        var offsetX: CGFloat = 0.0
        
        var optionRect = CGRect.zero
        var rowLeadingOptionRect = CGRect.zero
        
        switch rootButton.sizeClass {
        case .Phone:
            offsetX = keyRect.width
            optionRect = keyRect.insetBy(dx: OPTION_RECT_X_INSET, dy: OPTION_RECT_Y_INSET).offsetBy(dx: rootButton.optionsRowOffsets.first! * keyRect.width, dy: -(CGFloat(nbRows) * keyRect.height + OPTION_RECT_Y_OFFSET_PADDING))
            break

        case .Tablet:
            offsetX = keyRect.width
            optionRect = keyRect.insetBy(dx: OPTION_RECT_X_INSET, dy: OPTION_RECT_Y_INSET).offsetBy(dx: 0.0, dy: -(CGFloat(nbRows) * keyRect.height + OPTION_RECT_Y_OFFSET_PADDING))
            break
        }
    
        rowLeadingOptionRect = optionRect
        
        let offsetDirection: CGFloat = rootButton.optionsFanoutDirection == .Right ? 1.0 : -1.0
        optionRect = optionRect.offsetBy(dx: rootButton.optionsRowOffsets.first! * offsetX * offsetDirection, dy: 0.0)
    
        var rowCounter: Int = 0
        var keyCounter: Int = 0
        
        for _ in rootButton.optionsInputIDs {
            
            newInputOptionsRects.append(optionRect)
            
            // Offset the option rect
            switch rootButton.optionsFanoutDirection {
            case .Right:
                optionRect = optionRect.offsetBy(dx: offsetX + OPTION_X_GAP, dy: 0.0)
                break
            case .Left:
                optionRect = optionRect.offsetBy(dx: -offsetX - OPTION_X_GAP, dy: 0.0)
                break
            }
            
            keyCounter += 1
            if keyCounter == rootButton.optionsRowLengths[rowCounter] {
                
                keyCounter = 0
                rowCounter += 1

                if (rowCounter < nbRows) {
                    rowLeadingOptionRect = rowLeadingOptionRect.offsetBy(dx: 0.0, dy: keyRect.height) // + spacing)
                    optionRect = rowLeadingOptionRect.offsetBy(dx: rootButton.optionsRowOffsets[rowCounter] * keyRect.width * offsetDirection, dy: 0.0)
                }
                
            }
            
        }
        
        inputOptionsRects = newInputOptionsRects
        
    }
    
    
    
}






















































