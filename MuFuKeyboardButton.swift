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


import UIKit

let IPHONE5_PORTRAIT_BUTTON_WIDTH: CGFloat = 32.0
let IPHONE5_PORTRAIT_BUTTON_HEIGHT: CGFloat = 39.0
let IPHONE5_PORTRAIT_OPTION_WIDTH: CGFloat = 20.0
let IPHONE5_PORTRAIT_OPTION_HEIGHT: CGFloat = 20.0

let IPHONE5_LANDSCAPE_BUTTON_WIDTH: CGFloat = 30.0
let IPHONE5_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 39.0
let IPHONE5_LANDSCAPE_OPTION_WIDTH: CGFloat = 20.0
let IPHONE5_LANDSCAPE_OPTION_HEIGHT: CGFloat = 20.0

let IPHONE6_PORTRAIT_BUTTON_WIDTH: CGFloat = 38.0  //
let IPHONE6_PORTRAIT_BUTTON_HEIGHT: CGFloat = 39.0 // 43.0  //
let IPHONE6_PORTRAIT_OPTION_WIDTH: CGFloat = 38.0  //
let IPHONE6_PORTRAIT_OPTION_HEIGHT: CGFloat = 43.0  //

let IPHONE6_LANDSCAPE_BUTTON_WIDTH: CGFloat = 30.0
let IPHONE6_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 39.0
let IPHONE6_LANDSCAPE_OPTION_WIDTH: CGFloat = 20.0
let IPHONE6_LANDSCAPE_OPTION_HEIGHT: CGFloat = 20.0

let IPHONE6P_PORTRAIT_BUTTON_WIDTH: CGFloat = 42.0
let IPHONE6P_PORTRAIT_BUTTON_HEIGHT: CGFloat = 39.0
let IPHONE6P_PORTRAIT_OPTION_WIDTH: CGFloat = 42.0
let IPHONE6P_PORTRAIT_OPTION_HEIGHT: CGFloat = 43.0

let IPHONE6P_LANDSCAPE_BUTTON_WIDTH: CGFloat = 30.0
let IPHONE6P_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 39.0
let IPHONE6P_LANDSCAPE_OPTION_WIDTH: CGFloat = 20.0
let IPHONE6P_LANDSCAPE_OPTION_HEIGHT: CGFloat = 20.0

let IPHONEX_PORTRAIT_BUTTON_WIDTH: CGFloat = 30.0
let IPHONEX_PORTRAIT_BUTTON_HEIGHT: CGFloat = 39.0
let IPHONEX_PORTRAIT_OPTION_WIDTH: CGFloat = 20.0
let IPHONEX_PORTRAIT_OPTION_HEIGHT: CGFloat = 20.0

let IPHONEX_LANDSCAPE_BUTTON_WIDTH: CGFloat = 30.0
let IPHONEX_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 39.0
let IPHONEX_LANDSCAPE_OPTION_WIDTH: CGFloat = 20.0
let IPHONEX_LANDSCAPE_OPTION_HEIGHT: CGFloat = 20.0




let IPAD_AIR_PORTRAIT_BUTTON_WIDTH: CGFloat = 81.0 //49.0
let IPAD_AIR_PORTRAIT_BUTTON_HEIGHT: CGFloat = 50.0
let IPAD_AIR_PORTRAIT_OPTION_WIDTH: CGFloat = 60.0
let IPAD_AIR_PORTRAIT_OPTION_HEIGHT: CGFloat = 60.0

let IPAD_AIR_LANDSCAPE_BUTTON_WIDTH: CGFloat = 57.0
let IPAD_AIR_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 55.0
let IPAD_AIR_LANDSCAPE_OPTION_WIDTH: CGFloat = 50.0
let IPAD_AIR_LANDSCAPE_OPTION_HEIGHT: CGFloat = 50.0

let IPAD_PRO10_PORTRAIT_BUTTON_WIDTH: CGFloat = 88.0
let IPAD_PRO10_PORTRAIT_BUTTON_HEIGHT: CGFloat = 58.0
let IPAD_PRO10_PORTRAIT_OPTION_WIDTH: CGFloat = 70.0
let IPAD_PRO10_PORTRAIT_OPTION_HEIGHT: CGFloat = 70.0

let IPAD_PRO10_LANDSCAPE_BUTTON_WIDTH: CGFloat = 57.0
let IPAD_PRO10_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 55.0
let IPAD_PRO10_LANDSCAPE_OPTION_WIDTH: CGFloat = 50.0
let IPAD_PRO10_LANDSCAPE_OPTION_HEIGHT: CGFloat = 50.0

let IPAD_PRO12_PORTRAIT_BUTTON_WIDTH: CGFloat = 110.0
let IPAD_PRO12_PORTRAIT_BUTTON_HEIGHT: CGFloat = 58.0
let IPAD_PRO12_PORTRAIT_OPTION_WIDTH: CGFloat = 90.0
let IPAD_PRO12_PORTRAIT_OPTION_HEIGHT: CGFloat = 58.0

let IPAD_PRO12_LANDSCAPE_BUTTON_WIDTH: CGFloat = 57.0
let IPAD_PRO12_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 55.0
let IPAD_PRO12_LANDSCAPE_OPTION_WIDTH: CGFloat = 50.0
let IPAD_PRO12_LANDSCAPE_OPTION_HEIGHT: CGFloat = 50.0


let DEFAULT_BUTTON_WIDTH: CGFloat = 30.0
let DEFAULT_BUTTON_HEIGHT: CGFloat = 45.0
let DEFAULT_OPTION_WIDTH: CGFloat = 30.0
let DEFAULT_OPTION_HEIGHT: CGFloat = 45.0

let IPHONE_KEY_CORNER_RADIUS: CGFloat = 4.0
let IPAD_KEY_CORNER_RADIUS: CGFloat = 6.0

let DEFAULT_OPTIONS_VIEW_DELAY = 0.3







enum MuFuKeyboardButtonOptionsLayout { // which way the option selection fans out
    case Left
    case Inner
    case Right
}

enum MuFuKeyboardButtonActionStyle {
    case Character
    case Function // like shift, switch keyboard, etc.
}

/**
 The style of the keyboard button. You use these constants to set the value of the keyboard button style.
 */

enum MuFuKeyboardButtonStyle {
    case Phone
    case Tablet
}

enum MuFuKeyboardButtonDisplayType {
    case Label
    case Image
}

/**
 Notifies observers that the keyboard button has been pressed. The affected button is stored in the object parameter of the notification. The userInfo dictionary contains the pressed key and can be accessed with the MuFuKeyboardButtonKeyPressedKey key.
 */

extension Notification.Name {
        static let buttonWasPressed = Notification.Name("MuFuKeyboardButtonPressed")
        static let buttonDidShowInputOptions = Notification.Name("MuFuKeyboardButtonDidShowInputOptions")
        static let buttonDidHideInputOptions = Notification.Name("MuFuKeyboardButtonDidHideInputOptions")
}









protocol MFKBDelegate { // is the KeyboardViewController
    
    func handleKeyboardEvent(_ id: String)

}


@IBDesignable class MuFuKeyboardButton: UIControl, UIGestureRecognizerDelegate {
    
    var position: MuFuKeyboardButtonOptionsLayout
    
    var _font: UIFont? = .systemFont(ofSize: 22.0)
    var font: UIFont? {
        
        get {
            return _font
        }
        
        set(newFont) {

            if (_font != newFont) {
                willChangeValue(forKey: "_font")
                _font = newFont
                didChangeValue(forKey: "_font")
                displayLabel.font = newFont
                }
        }
        
    }
    
    var inputOptionsFont: UIFont?
    var keyColor: UIColor?
    
    var _keyTextColor: UIColor? = .clear
    var keyTextColor: UIColor? {
        
        get {
            return _keyTextColor
        }
        
        set(newKeyTextColor) {
            willChangeValue(forKey: "_keyTextColor")
            _keyTextColor = newKeyTextColor
            didChangeValue(forKey: "_keyTextColor")
            displayLabel.textColor = newKeyTextColor
        }

    }

    var keyShadowColor: UIColor?
    var keyHighlightedColor: UIColor?
    lazy var keyCornerRadius: CGFloat = 0.0
    
    var _style: MuFuKeyboardButtonStyle
    var style: MuFuKeyboardButtonStyle {
        
        get {
            return _style
        }
        
        set(newStyle) {
            willChangeValue(forKey: "_style")
            _style = newStyle
            didChangeValue(forKey: "_style")
            //updateDisplayStyle()
        }
        
    }
    
    @IBInspectable var borderColor: UIColor = .white
    
    var _displayType: MuFuKeyboardButtonDisplayType
    var displayType: MuFuKeyboardButtonDisplayType {
        
        get {
            return _displayType
        }
        
        set(newDisplayType) {
            willChangeValue(forKey: "displayType")
            _displayType = newDisplayType
            didChangeValue(forKey: "_displayType")
            
            if (newDisplayType == .Label) {
                displayLabel.isHidden = false
                displayImageView.isHidden = true
            } else if (newDisplayType == .Image) {
                displayLabel.isHidden = true
                displayImageView.isHidden = false
            }
            
        }
    }

    
    var _inputID: String? = "" // passed to delegate if pressed
    var inputID: String? {
        
        get {
            return _inputID
        }
        
        set(newInputID) {
            willChangeValue(forKey: "_inputID")
            _inputID = newInputID
            displayLabel.text = newInputID
        }
    }
    
    var _inputOptionsIDs: Array<String>? = []// one of these strings passed to the delegate when selected
    var inputOptionsIDs: Array<String>? {
        
        get {
            return _inputOptionsIDs
        }
        
        set(newInputOptionsIDs) {
            willChangeValue(forKey: "_inputOptionsIDs")
            _inputOptionsIDs = newInputOptionsIDs
            didChangeValue(forKey: "_inputOptionsIDs")
            
            optionsRowLengths = [inputOptionsIDs!.count]
            
            if ((inputOptionsIDs?.count)! > 0) {
                setupInputOptionsConfiguration()
            } else {
                tearDownInputOptionsConfiguration()
            }
        }
    }
    
    var inputOptionsGlyphs: Array<String>? = []
    
    var _inputOptionsImages: Array<UIImage> = []
    var inputOptionsImages: Array<UIImage> {
        
        get {
            return _inputOptionsImages
        }
        
        set(newInputOptionsImages) {
            willChangeValue(forKey: "_inputOptionsImages")
            _inputOptionsImages = newInputOptionsImages
            didChangeValue(forKey: "_inputOptionsImages")
            
            // automatically save inverted images
            highlightedInputOptionsImages = []
            for inputOptionImage: UIImage in newInputOptionsImages {
                highlightedInputOptionsImages.append(inputOptionImage.inverted()!)
            }

            
            if ((inputOptionsImages.count) > 0) {
                setupInputOptionsConfiguration()
            } else {
                tearDownInputOptionsConfiguration()
            }
        }
    }
    
    var _highlightedInputOptionsImages: Array<UIImage> = []
    var highlightedInputOptionsImages: Array<UIImage> {
        
        get {
            return _highlightedInputOptionsImages
        }
        
        set(newHighlightedInputOptionsImages) {
            willChangeValue(forKey: "_highlightedInputOptionsImages")
            _highlightedInputOptionsImages = newHighlightedInputOptionsImages
            didChangeValue(forKey: "_highlightedInputOptionsImages")
            if ((inputOptionsImages.count) > 0) {
                setupInputOptionsConfiguration()
            } else {
                tearDownInputOptionsConfiguration()
            }
        }
    }

    
    var buttonMagnifiedView: MuFuKeyboardButtonDetailView? // button and magnifier
    var buttonOptionsView: MuFuKeyboardButtonDetailView? // button options
    
    lazy var optionsViewLayout: MuFuKeyboardButtonOptionsLayout = .Inner
    lazy var optionsViewRecognizer = UILongPressGestureRecognizer()
    lazy var panGestureRecognizer = UIPanGestureRecognizer()
    
    var delegate: MFKBDelegate?
    var showMagnifier: Bool = true
    var optionsViewDelay: Float = Float(DEFAULT_OPTIONS_VIEW_DELAY)
    
    var optionsRowLengths: [Int] = [0]
    var optionsRowOffsets: [CGFloat] = [0.0]
    
    var labelIsPersistent: Bool = true
    
    var displayLabel = UILabel()
    var displayImageView = UIImageView()
    var magnifiedDisplayImageView = UIImageView()
    
    var magnifiedDisplayLabelFont: UIFont = .systemFont(ofSize: 44.0)
    
    //var optionWidth: CGFloat = DEFAULT_OPTION_WIDTH
    //var optionHeight: CGFloat = DEFAULT_OPTION_HEIGHT

    //var optionsRectWidth: CGFloat = 20.0
    
    
    
    ////////////////////
    // IMPLEMENTATION //
    ////////////////////
    
    override func prepareForInterfaceBuilder() {
        // dummy values
        displayLabel.text = "MuFuButton"
        displayImageView.image = UIImage(named:"sqrt")
        displayImageView.contentMode = .center
    }
    
    init() {
        let frame = CGRect(x:0.0,y:0.0,width:DEFAULT_BUTTON_WIDTH,height:DEFAULT_BUTTON_HEIGHT)
        _style = .Phone
        _displayType = .Label
        position = .Inner
        super.init(frame:frame)
        commonInit()
    }
    
    override init(frame: CGRect) {
        _style = .Phone
        _displayType = .Label
        position = .Inner
        super.init(frame: frame)
        commonInit()
    }
    
    init(x: CGFloat, y: CGFloat, style: MuFuKeyboardButtonStyle) {
        _style = style
        let newFrame = CGRect(x: x, y: y, width: DEFAULT_BUTTON_WIDTH, height: DEFAULT_BUTTON_HEIGHT)
        _displayType = .Label
        position = .Inner
        super.init(frame: newFrame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        _style = .Phone
        _displayType = .Label
        position = .Inner
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        
        updateDisplayStyle()
        
        // Default appearance
        font = .systemFont(ofSize: 22.0)
        inputOptionsFont = .systemFont(ofSize: 24.0)
        keyColor = .white
        keyTextColor = .black
        keyShadowColor = UIColor(red: 136.0/255.0, green: 138.0/255.0, blue: 142.0/255.0, alpha: 1.0)
        keyHighlightedColor = UIColor(red: 213.0/255.0, green: 214.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        
        // Styling
        backgroundColor = .clear
        clipsToBounds = false
        layer.masksToBounds = false
        contentHorizontalAlignment = .center
        
        // State handling
        addTarget(self, action: #selector(MuFuKeyboardButton.handleTouchDown), for: .touchDown)
        addTarget(self, action: #selector(MuFuKeyboardButton.handleTouchUpInside), for: .touchUpInside)
        addTarget(self, action: #selector(MuFuKeyboardButton.handleTouchUpOutside), for: .touchUpOutside)
        
        
        // Add label or image
        
        let newDisplayLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
        newDisplayLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        newDisplayLabel.textAlignment = .center
        newDisplayLabel.backgroundColor = .clear
        newDisplayLabel.isUserInteractionEnabled = false
        newDisplayLabel.textColor = keyTextColor
        newDisplayLabel.font = font
        newDisplayLabel.text = inputID!
        
        self.displayLabel = newDisplayLabel
        self.addSubview(newDisplayLabel)
        
        let newDisplayImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
        //newDisplayImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //newDisplayImageView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        newDisplayImageView.backgroundColor = .clear
        newDisplayImageView.isUserInteractionEnabled = false
        
        self.displayImageView = newDisplayImageView
        self.addSubview(newDisplayImageView)
        
        optionsRowLengths = [(inputOptionsIDs?.count)!] // unless specified from outside
        
        inputOptionsGlyphs = inputOptionsIDs
        
    }
    
    
    
    override func didMoveToSuperview() {
        updateButtonPosition()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setNeedsDisplay()
        updateButtonPosition()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // Only allow simultaneous recognition with our internal recognizers
        return (gestureRecognizer == panGestureRecognizer || gestureRecognizer == optionsViewRecognizer) && (otherGestureRecognizer == panGestureRecognizer || optionsViewRecognizer == optionsViewRecognizer)
    }
    
    override var description: String {
        let description = String(format: "<%@ %p>; frame = %@; input = %@; inputOptions = %@", String(describing: type(of:self)), self, String(describing: frame), inputID!, inputOptionsIDs!)
        return description
    }
    
    func showMagnifiedInputView() {
        
        if (style == .Phone) {
            hideMagnifiedInputView()
            buttonMagnifiedView = MuFuKeyboardButtonDetailView(keyboardButton: self, newType: .Magnified)
            buttonMagnifiedView?.displayImageView.image = magnifiedDisplayImageView.image
            window?.addSubview(buttonMagnifiedView!)
        } else {
            setNeedsDisplay()
        }
        
    }
    
    @objc func showInputOptionsView(recognizer: UILongPressGestureRecognizer) {
        
        if (recognizer.state == .began) {
            
            if (buttonOptionsView == nil) {
                
                let newButtonOptionsView = MuFuKeyboardButtonDetailView(keyboardButton: self, newType: .Options)
                window?.addSubview(newButtonOptionsView)
                buttonOptionsView = newButtonOptionsView
                
                NotificationCenter.default.post(name: .buttonDidShowInputOptions, object: self)
                hideMagnifiedInputView()
                
            }
            
        } else if (recognizer.state == .cancelled || recognizer.state == .ended) {
            
            if (panGestureRecognizer.state != .recognized) {
                handleTouchUpInside()
            }
            
        }
        
    }
    
    func hideMagnifiedInputView() {
        buttonMagnifiedView?.removeFromSuperview()
        buttonMagnifiedView = nil
        setNeedsDisplay()
    }
    
    func hideInputOptionsView() {
        
        if buttonOptionsView?.type == .Options {
            NotificationCenter.default.post(name: .buttonDidHideInputOptions, object: self)
        }
        
        buttonOptionsView?.removeFromSuperview()
        buttonOptionsView = nil
    }
    
    func updateDisplayStyle() {
        
        let screenSize = max(UIScreen.main.bounds.width,UIScreen.main.bounds.height)
        
        let myTrue: Bool = true
        
        switch (UIDevice.current.userInterfaceIdiom, screenSize, myTrue) { //UIDevice.current.orientation.isPortrait) {
            
        case (.phone, 568.0,true): // iPhone 5,5C,5S,SE Portrait
            style = .Phone
            self.frame.size.width = IPHONE5_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPHONE5_PORTRAIT_BUTTON_HEIGHT
            keyCornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone, 568.0,false): // iPhone 5,5C,5S,SE Landscape
            style = .Phone
            self.frame.size.width = IPHONE5_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPHONE5_LANDSCAPE_BUTTON_HEIGHT
            keyCornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone, 667.0, true): // iPhone 6,6S,7,8 Portrait
            style = .Phone
            self.frame.size.width = IPHONE6_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPHONE6_PORTRAIT_BUTTON_HEIGHT
            keyCornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone, 667.0, false): // iPhone 6,6S,7,8 Landscape
            style = .Phone
            self.frame.size.width = IPHONE6_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPHONE6_LANDSCAPE_BUTTON_HEIGHT
            keyCornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone, 736.0,true): // iPhone 6+,6S+,7+,8+ Portrait
            style = .Phone
            self.frame.size.width = IPHONE6P_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPHONE6P_PORTRAIT_BUTTON_HEIGHT
            keyCornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone,736.0,false): // iPhone 6+,6S+,7+,8+ Landscape
            style = .Phone
            self.frame.size.width = IPHONE6P_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPHONE6P_LANDSCAPE_BUTTON_HEIGHT
            keyCornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone,812.0,true): // iPhone X Portrait
            style = .Phone
            self.frame.size.width = IPHONEX_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPHONEX_PORTRAIT_BUTTON_HEIGHT
            keyCornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone,812.0,false): // iPhone X Landscape
            style = .Phone
            self.frame.size.width = IPHONEX_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPHONEX_LANDSCAPE_BUTTON_HEIGHT
            keyCornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
            
            
            
        case (.pad,1024.0,true): // iPad Air/Mini Portrait
            style = .Tablet
            self.frame.size.width = IPAD_AIR_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPAD_AIR_PORTRAIT_BUTTON_HEIGHT
            keyCornerRadius = IPAD_KEY_CORNER_RADIUS
            //optionWidth = IPAD_PORTRAIT_OPTION_WIDTH
            //optionHeight = IPAD_PORTRAIT_OPTION_HEIGHT
            break
            
        case (.pad,1024.0,false): // iPad Air/Mini Landscape
            style = .Tablet
            self.frame.size.width = IPAD_AIR_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPAD_AIR_LANDSCAPE_BUTTON_HEIGHT
            keyCornerRadius = IPAD_KEY_CORNER_RADIUS
            break
            
        case (.pad,1112.0,true): // iPad Pro 10" Portrait
            style = .Tablet
            self.frame.size.width = IPAD_PRO10_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPAD_PRO10_PORTRAIT_BUTTON_HEIGHT
            keyCornerRadius = IPAD_KEY_CORNER_RADIUS
            break
            
        case (.pad,1112.0,false): // iPad Pro 10" Landscape
            style = .Tablet
            self.frame.size.width = IPAD_PRO10_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPAD_PRO10_LANDSCAPE_BUTTON_HEIGHT
            keyCornerRadius = IPAD_KEY_CORNER_RADIUS
            break
            
        case (.pad,1366.0,true): // iPad Pro 12" Portrait
            style = .Tablet
            self.frame.size.width = IPAD_PRO12_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPAD_PRO12_PORTRAIT_BUTTON_HEIGHT
            keyCornerRadius = IPAD_KEY_CORNER_RADIUS
            break
            
        case (.pad,1366.0,false): // iPad Pro 12" Landscape
            style = .Tablet
            self.frame.size.width = IPAD_PRO12_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPAD_PRO12_LANDSCAPE_BUTTON_HEIGHT
            keyCornerRadius = IPAD_KEY_CORNER_RADIUS
            break
            
            
        default:
            NSLog("screen size and orientation undetected!")
            break
        }
        
        
        
//        switch style {
//        case .Phone:
//            keyCornerRadius = 4.0
//            frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: IPHONE_BUTTON_WIDTH, height: IPHONE_BUTTON_HEIGHT)
//            break
//        case .Tablet:
//            keyCornerRadius = 6.0
//            frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: IPAD_BUTTON_WIDTH, height: IPAD_BUTTON_HEIGHT)
//            break
//        }
    
        setNeedsDisplay()
        
    }
    
    func updateButtonPosition() {
        
        // Determine the button's position state based on the superview padding
        let leftPadding = frame.minX
        let rightPadding = (superview?.frame.maxX)! - frame.maxX
        let minimumClearance = frame.width * 0.5 + 8.0
        
        if (leftPadding >= minimumClearance && rightPadding >= minimumClearance) {
            position = .Inner
        } else if (leftPadding > rightPadding) {
            position = .Left
        } else {
            position = .Right
        }
    }
    
    func setupInputOptionsConfiguration() {
        
        tearDownInputOptionsConfiguration()
        
        if ((inputOptionsIDs?.count)! > 0) {
            
            let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showInputOptionsView(recognizer:)))
            longPressGestureRecognizer.minimumPressDuration = CFTimeInterval(optionsViewDelay)
            longPressGestureRecognizer.delegate = self
            addGestureRecognizer(longPressGestureRecognizer)
            optionsViewRecognizer = longPressGestureRecognizer
            
            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanning(recognizer:)))
            panGestureRecognizer.delegate = self
            addGestureRecognizer(panGestureRecognizer)
            self.panGestureRecognizer = panGestureRecognizer
            
        }
    }
    
    func tearDownInputOptionsConfiguration() {
        removeGestureRecognizer(optionsViewRecognizer)
        removeGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func handleTouchDown() {
        UIDevice.current.playInputClick()
        if showMagnifier {
            showMagnifiedInputView()
        }
    }
    
    @objc func handleTouchUpInside() {
        delegate?.handleKeyboardEvent(inputID!)
        if showMagnifier {
            hideMagnifiedInputView()
        }
        hideInputOptionsView()
    }
    
    @objc func handleTouchUpOutside() {
        delegate?.handleKeyboardEvent(inputID!)
        if showMagnifier {
            hideMagnifiedInputView()
        }
        hideInputOptionsView()
    }
    
    @objc func handlePanning(recognizer: UIPanGestureRecognizer) {
        
        if (recognizer.state == .ended || recognizer.state == .cancelled) {
            if let idx = buttonOptionsView?.highlightedInputIndex {
                if idx != NSNotFound {
                    let inputOptionID = inputOptionsIDs?[idx]
                    delegate?.handleKeyboardEvent(inputOptionID!)
                }
            }
        
            hideInputOptionsView()
            
        } else {
            let location = recognizer.location(in: superview)
            buttonOptionsView?.updateHighlightedInputIndex(forPoint: location)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        hideMagnifiedInputView()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        hideMagnifiedInputView()
    }
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        var color = keyColor
        if (style == .Tablet && state == .highlighted) {
            color = keyHighlightedColor
        }
        let shadow = keyShadowColor
        let shadowOffset = CGSize(width: 0.1, height: 1.1)
        let shadowBlurRadius: CGFloat = 0.0
        
        let roundedRectanglePath = UIBezierPath(roundedRect: CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height - 1.0), cornerRadius: keyCornerRadius)
        context?.saveGState()
        context?.setShadow(offset: shadowOffset, blur: shadowBlurRadius, color: shadow?.cgColor)
        color?.setFill()
        roundedRectanglePath.fill()
        context?.restoreGState()
        
    }
    
    
    
}




























