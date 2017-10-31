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

let IPHONE5_PORTRAIT_BUTTON_WIDTH: CGFloat = 24.0
let IPHONE5_PORTRAIT_BUTTON_HEIGHT: CGFloat = 38.0
let IPHONE5_PORTRAIT_OPTION_WIDTH: CGFloat = 24.0
let IPHONE5_PORTRAIT_OPTION_HEIGHT: CGFloat = 38.0
let IPHONE5_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 3.0
let IPHONE5_PORTRAIT_BUTTON_X_GAP: CGFloat = 5.0
let IPHONE5_PORTRAIT_BUTTON_Y_GAP: CGFloat = 16.0
// set

let IPHONE5_LANDSCAPE_BUTTON_WIDTH: CGFloat = 47.0
let IPHONE5_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 32.0
let IPHONE5_LANDSCAPE_OPTION_WIDTH: CGFloat = 47.0
let IPHONE5_LANDSCAPE_OPTION_HEIGHT: CGFloat = 32.0
// set
let IPHONE5_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPHONE5_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPHONE5_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0



let IPHONE6_PORTRAIT_BUTTON_WIDTH: CGFloat = 28.0
let IPHONE6_PORTRAIT_BUTTON_HEIGHT: CGFloat = 42.0
let IPHONE6_PORTRAIT_OPTION_WIDTH: CGFloat = 28.0
let IPHONE6_PORTRAIT_OPTION_HEIGHT: CGFloat = 42.0
let IPHONE6_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 3.0
let IPHONE6_PORTRAIT_BUTTON_X_GAP: CGFloat = 6.0
let IPHONE6_PORTRAIT_BUTTON_Y_GAP: CGFloat = 12.0
// set

let IPHONE6_LANDSCAPE_BUTTON_WIDTH: CGFloat = 30.0
let IPHONE6_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 39.0
let IPHONE6_LANDSCAPE_OPTION_WIDTH: CGFloat = 20.0
let IPHONE6_LANDSCAPE_OPTION_HEIGHT: CGFloat = 20.0
let IPHONE6_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPHONE6_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPHONE6_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0



let IPHONE6P_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 4.0
let IPHONE6P_PORTRAIT_BUTTON_X_GAP: CGFloat = 9.0
let IPHONE6P_PORTRAIT_BUTTON_Y_GAP: CGFloat = 11.0
let IPHONE6P_PORTRAIT_BUTTON_WIDTH: CGFloat = 31.0
let IPHONE6P_PORTRAIT_BUTTON_HEIGHT: CGFloat = 45.0
let IPHONE6P_PORTRAIT_OPTION_WIDTH: CGFloat = 31.0
let IPHONE6P_PORTRAIT_OPTION_HEIGHT: CGFloat = 45.0
// set

let IPHONE6P_LANDSCAPE_BUTTON_WIDTH: CGFloat = 30.0
let IPHONE6P_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 39.0
let IPHONE6P_LANDSCAPE_OPTION_WIDTH: CGFloat = 20.0
let IPHONE6P_LANDSCAPE_OPTION_HEIGHT: CGFloat = 20.0
let IPHONE6P_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPHONE6P_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPHONE6P_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0



let IPHONEX_PORTRAIT_BUTTON_WIDTH: CGFloat = 28.0
let IPHONEX_PORTRAIT_BUTTON_HEIGHT: CGFloat = 42.0
let IPHONEX_PORTRAIT_OPTION_WIDTH: CGFloat = 28.0
let IPHONEX_PORTRAIT_OPTION_HEIGHT: CGFloat = 42.0
let IPHONEX_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 3.0
let IPHONEX_PORTRAIT_BUTTON_X_GAP: CGFloat = 6.0
let IPHONEX_PORTRAIT_BUTTON_Y_GAP: CGFloat = 12.0
// set

let IPHONEX_LANDSCAPE_BUTTON_WIDTH: CGFloat = 30.0
let IPHONEX_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 39.0
let IPHONEX_LANDSCAPE_OPTION_WIDTH: CGFloat = 20.0
let IPHONEX_LANDSCAPE_OPTION_HEIGHT: CGFloat = 20.0
let IPHONEX_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPHONEX_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPHONEX_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0





let IPAD_AIR_PORTRAIT_BUTTON_WIDTH: CGFloat = 49.0
let IPAD_AIR_PORTRAIT_BUTTON_HEIGHT: CGFloat = 57.0
let IPAD_AIR_PORTRAIT_OPTION_WIDTH: CGFloat = 49.0
let IPAD_AIR_PORTRAIT_OPTION_HEIGHT: CGFloat = 57.0
let IPAD_AIR_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 6.0
let IPAD_AIR_PORTRAIT_BUTTON_X_GAP: CGFloat = 12.0
let IPAD_AIR_PORTRAIT_BUTTON_Y_GAP: CGFloat = 9.0
// set

let IPAD_AIR_LANDSCAPE_BUTTON_WIDTH: CGFloat = 57.0
let IPAD_AIR_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 55.0
let IPAD_AIR_LANDSCAPE_OPTION_WIDTH: CGFloat = 50.0
let IPAD_AIR_LANDSCAPE_OPTION_HEIGHT: CGFloat = 50.0
let IPAD_AIR_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPAD_AIR_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPAD_AIR_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0



let IPAD_PRO10_PORTRAIT_BUTTON_WIDTH: CGFloat = 53.5
let IPAD_PRO10_PORTRAIT_BUTTON_HEIGHT: CGFloat = 57.0
let IPAD_PRO10_PORTRAIT_OPTION_WIDTH: CGFloat = 53.5
let IPAD_PRO10_PORTRAIT_OPTION_HEIGHT: CGFloat = 57.0
let IPAD_PRO10_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 6.5
let IPAD_PRO10_PORTRAIT_BUTTON_X_GAP: CGFloat = 12.5
let IPAD_PRO10_PORTRAIT_BUTTON_Y_GAP: CGFloat = 9.0
// set

let IPAD_PRO10_LANDSCAPE_BUTTON_WIDTH: CGFloat = 57.0
let IPAD_PRO10_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 55.0
let IPAD_PRO10_LANDSCAPE_OPTION_WIDTH: CGFloat = 50.0
let IPAD_PRO10_LANDSCAPE_OPTION_HEIGHT: CGFloat = 50.0
let IPAD_PRO10_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPAD_PRO10_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPAD_PRO10_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0



let IPAD_PRO12_PORTRAIT_BUTTON_WIDTH: CGFloat = 58.0
let IPAD_PRO12_PORTRAIT_BUTTON_HEIGHT: CGFloat = 63.0
let IPAD_PRO12_PORTRAIT_OPTION_WIDTH: CGFloat = 58.0
let IPAD_PRO12_PORTRAIT_OPTION_HEIGHT: CGFloat = 63.0
let IPAD_PRO12_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 4.0
let IPAD_PRO12_PORTRAIT_BUTTON_X_GAP: CGFloat = 7.0
let IPAD_PRO12_PORTRAIT_BUTTON_Y_GAP: CGFloat = 7.0
// set

let IPAD_PRO12_LANDSCAPE_BUTTON_WIDTH: CGFloat = 57.0
let IPAD_PRO12_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 55.0
let IPAD_PRO12_LANDSCAPE_OPTION_WIDTH: CGFloat = 50.0
let IPAD_PRO12_LANDSCAPE_OPTION_HEIGHT: CGFloat = 50.0
let IPAD_PRO12_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPAD_PRO12_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPAD_PRO12_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0



let IPHONE_KEY_CORNER_RADIUS: CGFloat = 4.0
let IPAD_KEY_CORNER_RADIUS: CGFloat = 6.0



let DEFAULT_BUTTON_WIDTH: CGFloat = 50.0
let DEFAULT_BUTTON_HEIGHT: CGFloat = 50.0
let DEFAULT_OPTION_WIDTH: CGFloat = 30.0
let DEFAULT_OPTION_HEIGHT: CGFloat = 45.0
let DEFAULT_OPTIONS_VIEW_DELAY = 0.2

let DEFAULT_FONT: UIFont = .systemFont(ofSize: 22.0)
let DEFAULT_OPTION_FONT: UIFont = .systemFont(ofSize: 24.0)
let DEFAULT_MAGNIFIER_FONT: UIFont = .systemFont(ofSize: 44.0)
let DEFAULT_KEY_COLOR: UIColor = .white
let DEFAULT_SHADOW_COLOR: UIColor = UIColor(red: 136.0/255.0, green: 138.0/255.0, blue: 142.0/255.0, alpha: 1.0)
let DEFAULT_BORDER_COLOR: UIColor = .clear
let DEFAULT_HIGHLIGHT_COLOR: UIColor = UIColor(red: 213.0/255.0, green: 214.0/255.0, blue: 216.0/255.0, alpha: 1.0)
let DEFAULT_CORNER_RADIUS: CGFloat = 5.0

let DEFAULT_SHADOW_X_OFFSET: CGFloat = 0.1
let DEFAULT_SHADOW_Y_OFFSET: CGFloat = 1.0

let POSITION_CLEARANCE_PADDING: CGFloat = 8.0 // this + button's half-width is threshold for .Inner position autodetect (updateButtonPosition)


enum MuFuKeyboardButtonPosition { // determines look of the magnifier and default option fanout direction
    case Left
    case Inner // will choose Left or Right depending on which screen edge the button is closer to
    case Right
}

enum MuFuKeyboardButtonOptionsFanoutDirection { // which way the option selection fans out
    case Left
    case Right
}


enum MuFuKeyboardButtonSizeClass {
    case Phone
    case Tablet
}

enum MuFuKeyboardButtonTitleType {
    case Label
    case Image
}

/*
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


struct ScreenGeometry {
    var interfaceIdiom: UIUserInterfaceIdiom = .phone
    var screenSize: CGFloat = 0.0
    var isPortrait: Bool = true
}

@IBDesignable class MuFuKeyboardButton: UIControl, UIGestureRecognizerDelegate {
    
    var sizeClass: MuFuKeyboardButtonSizeClass {
        // the size class determines whether to draw a magnifier view
        // when the button is tapped, and whether to connect the input options
        // fanout with the button
        didSet {
            // setupAppearanceFromDevice() // still used?
        }
    }
    
    var screenGeometry: ScreenGeometry {
        var returnValue = ScreenGeometry()
        returnValue.interfaceIdiom = UIDevice.current.userInterfaceIdiom
        returnValue.screenSize = max(UIScreen.main.bounds.width,UIScreen.main.bounds.height)
        returnValue.isPortrait = true //UIDevice.current.orientation.isPortrait)
        return returnValue
    }
    
    var titleLabel = UILabel()
    var titleImageView = UIImageView()
    
    var titleImage: UIImage? {
        get { return titleImageView.image }
        set {
            titleImageView.image = newValue
            magnifierTitleImageView.image = newValue
            magnifier?.titleImageView = magnifierTitleImageView
        }
    }
    
    var titleIsPersistent: Bool = true // false means: displayed label/image changes to last selected option
    
    // shortcuts for the label's properties
    
    var title: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var titleFont: UIFont? {
        get { return titleLabel.font }
        set { titleLabel.font = newValue }
    }
    
    var titleColor: UIColor? {
        get { return titleLabel.textColor }
        set { titleLabel.textColor = newValue }
    }
    
    var color: UIColor? = DEFAULT_KEY_COLOR // the key's background color
    //  the existing backgroundColor has to remain clear so we can have round corners
    var borderColor: UIColor = DEFAULT_BORDER_COLOR
    var shadowColor: UIColor? = DEFAULT_SHADOW_COLOR
    var highlightColor: UIColor? = DEFAULT_HIGHLIGHT_COLOR
    
    var shadowXOffset: CGFloat = DEFAULT_SHADOW_X_OFFSET
    var shadowYOffset: CGFloat = DEFAULT_SHADOW_Y_OFFSET

    lazy var cornerRadius: CGFloat = DEFAULT_CORNER_RADIUS // why lazy?
    
    var titleType: MuFuKeyboardButtonTitleType {
        // label or image?
        didSet {
            magnifier?.titleType = titleType
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
    
    
    var inputID: String = "" // passed to the delegate when key is tapped
    
    var optionsFont: UIFont = DEFAULT_OPTION_FONT // used for the input options
    
    var optionsInputIDs: Array<String> = [] { // one of these strings is passed to the delegate when selected
        didSet {
            if (optionsTitles.count == 0) {
                // use input IDs for the titles by default
                optionsTitles = optionsInputIDs
            }
            if (optionsRowLengths == [0]) { // is the default value
                optionsRowLengths = [optionsInputIDs.count]
            }
            if (optionsInputIDs.count > 0) {
                // we may want to change the options later in the
                // button's life
                setupOptionsConfiguration()
            } else {
                // options have been deleted entirely
                // from button later in its life
                tearDownOptionsConfiguration()
            }
        }
    }
    
    var optionsTitles: Array<String> = [] // will by default be set to the optionInputIDs
    
    var optionsImages: Array<UIImage> = [] {
        didSet {
            // automatically save inverted images
            highlightedOptionsImages = []
            for inputOptionImage: UIImage in optionsImages {
                highlightedOptionsImages.append(inputOptionImage.inverted()!)
            }
        }
    }
    
    var highlightedOptionsImages: Array<UIImage> = []
    // this is a stored property, not computed for performance
    // and because we might want to use custom images for the highlighted state
    
    var position: MuFuKeyboardButtonPosition = .Inner
    
    // position determines the direction in which the options will fan out
    var optionsFanoutDirection: MuFuKeyboardButtonOptionsFanoutDirection {
        switch position {
        case .Left:
            return .Right
        case .Right:
            return .Left
        case .Inner:
            // find horizontal position in superview
            if let superView = self.superview {
                let halfWidth = superView.frame.width / 2.0
                if self.center.x <= halfWidth { return .Right } else { return .Left }
            }
            // if there is no superview, the button is still in preparation
            // and we return .Right as default
            return .Right
        }
    }
    
    var magnifier: MuFuKeyboardButtonDetailView? // button and magnifier
    var magnifierTitleLabelFont: UIFont? = DEFAULT_MAGNIFIER_FONT
    var magnifierTitleImageView = UIImageView()
    var shouldShowMagnifier: Bool = true
    
    var optionsView: MuFuKeyboardButtonDetailView? // button options
    lazy var optionsViewRecognizer = UILongPressGestureRecognizer()
    lazy var panGestureRecognizer = UIPanGestureRecognizer()
    
    var optionsViewDelay = Float(DEFAULT_OPTIONS_VIEW_DELAY)
    var optionsRowLengths: [Int] = [0]
    var optionsRowOffsets: [CGFloat] = [0.0]

    
    var delegate: MFKBDelegate?
    // handles keyboard events by getting passed an input ID
    
    var optionWidth: CGFloat = 50.0
    var optionHeight: CGFloat = 50.0
    
    ////////////////////
    // IMPLEMENTATION //
    ////////////////////
    
    override func prepareForInterfaceBuilder() {
        // dummy values
        titleLabel.text = "MuFuButton"
        titleImage = UIImage(named:"sqrt")
        titleImageView.contentMode = .scaleAspectFit // .center
    }
    
    init() {
        //NSLog("MFKB.init()")
        let frame = CGRect(x:0.0, y:0.0, width:DEFAULT_BUTTON_WIDTH, height:DEFAULT_BUTTON_HEIGHT)
        sizeClass = .Phone
        titleType = .Label
        position = .Inner
        optionWidth = 0.0
        super.init(frame: frame)
        commonInit()
    }
    
    override init(frame: CGRect) {
        //NSLog("MFKB.init(frame:)")
        sizeClass = .Phone
        titleType = .Label
        position = .Inner
        optionWidth = 0.0
        super.init(frame: frame)
        commonInit()
    }
    
    init(x: CGFloat, y: CGFloat, style: MuFuKeyboardButtonSizeClass) {
        //NSLog("MFKB.init(x:y:style:)")
        sizeClass = style
        let newFrame = CGRect(x: x, y: y, width: DEFAULT_BUTTON_WIDTH, height: DEFAULT_BUTTON_HEIGHT)
        titleType = .Label
        position = .Inner
        optionWidth = 0.0
        super.init(frame: newFrame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        sizeClass = .Phone
        titleType = .Label
        position = .Inner
        optionWidth = 0.0
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func setupAppearanceFromDevice() {
        //NSLog("MuFuKeyboardButton.setupAppearanceFromDevice()")
        switch (screenGeometry.interfaceIdiom, screenGeometry.screenSize, screenGeometry.isPortrait) {
            
        case (.phone, 568.0,true): // iPhone 5,5C,5S,SE Portrait
            sizeClass = .Phone
            self.frame.size.width = IPHONE5_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPHONE5_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone, 568.0,false): // iPhone 5,5C,5S,SE Landscape
            sizeClass = .Phone
            self.frame.size.width = IPHONE5_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPHONE5_LANDSCAPE_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone, 667.0, true): // iPhone 6,6S,7,8 Portrait
            sizeClass = .Phone
            self.frame.size.width = IPHONE6_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPHONE6_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone, 667.0, false): // iPhone 6,6S,7,8 Landscape
            sizeClass = .Phone
            self.frame.size.width = IPHONE6_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPHONE6_LANDSCAPE_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone, 736.0,true): // iPhone 6+,6S+,7+,8+ Portrait
            sizeClass = .Phone
            self.frame.size.width = IPHONE6P_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPHONE6P_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone,736.0,false): // iPhone 6+,6S+,7+,8+ Landscape
            sizeClass = .Phone
            self.frame.size.width = IPHONE6P_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPHONE6P_LANDSCAPE_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone,812.0,true): // iPhone X Portrait
            sizeClass = .Phone
            self.frame.size.width = IPHONEX_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPHONEX_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone,812.0,false): // iPhone X Landscape
            sizeClass = .Phone
            self.frame.size.width = IPHONEX_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPHONEX_LANDSCAPE_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
            
            
            
        case (.pad,1024.0,true): // iPad Air/Mini Portrait
            sizeClass = .Tablet
            self.frame.size.width = IPAD_AIR_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPAD_AIR_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPAD_KEY_CORNER_RADIUS
            break
            
        case (.pad,1024.0,false): // iPad Air/Mini Landscape
            sizeClass = .Tablet
            self.frame.size.width = IPAD_AIR_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPAD_AIR_LANDSCAPE_BUTTON_HEIGHT
            cornerRadius = IPAD_KEY_CORNER_RADIUS
            break
            
        case (.pad,1112.0,true): // iPad Pro 10" Portrait
            sizeClass = .Tablet
            self.frame.size.width = IPAD_PRO10_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPAD_PRO10_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPAD_KEY_CORNER_RADIUS
            break
            
        case (.pad,1112.0,false): // iPad Pro 10" Landscape
            sizeClass = .Tablet
            self.frame.size.width = IPAD_PRO10_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPAD_PRO10_LANDSCAPE_BUTTON_HEIGHT
            cornerRadius = IPAD_KEY_CORNER_RADIUS
            break
            
        case (.pad,1366.0,true): // iPad Pro 12" Portrait
            sizeClass = .Tablet
            self.frame.size.width = IPAD_PRO12_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPAD_PRO12_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPAD_KEY_CORNER_RADIUS
            break
            
        case (.pad,1366.0,false): // iPad Pro 12" Landscape
            sizeClass = .Tablet
            self.frame.size.width = IPAD_PRO12_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPAD_PRO12_LANDSCAPE_BUTTON_HEIGHT
            cornerRadius = IPAD_KEY_CORNER_RADIUS
            break
            
            
        default:
            //NSLog("screen size and orientation undetected!")
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
    
    func commonInit() {
        //NSLog("MFKB.commonInit()")
        setupAppearanceFromDevice()
        
        //        // Default appearance
        //        titleFont = DEFAULT_FONT
        //        optionsFont = .systemFont(ofSize: 24.0)
        //        color = .white
        //        titleColor = .black
        //        shadowColor = UIColor(red: 136.0/255.0, green: 138.0/255.0, blue: 142.0/255.0, alpha: 1.0)
        //        highlightColor = UIColor(red: 213.0/255.0, green: 214.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        
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
        
        //        let newtitleLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
        //        newtitleLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //        newtitleLabel.textAlignment = .center
        //        newtitleLabel.backgroundColor = .clear
        //        newtitleLabel.isUserInteractionEnabled = false
        //        newtitleLabel.textColor = titleColor
        //        newtitleLabel.font = titleFont
        //        newtitleLabel.text = inputID
        //
        //        self.titleLabel = newtitleLabel
        
        titleLabel.frame = self.bounds
        titleLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        titleLabel.textAlignment = .center
        titleLabel.isUserInteractionEnabled = false
        
        self.addSubview(titleLabel)
        
        //        let newtitleImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
        //        //newtitleImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //        //newtitleImageView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        //        newtitleImageView.backgroundColor = .clear
        //        newtitleImageView.isUserInteractionEnabled = false
        //
        //        self.titleImageView = newtitleImageView
        //        self.addSubview(newtitleImageView)
        
        titleImageView.frame = self.bounds
        
        //newtitleImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        titleImageView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        
        
        titleImageView.backgroundColor = .clear
        titleImageView.isUserInteractionEnabled = false
        titleImageView.contentMode = .scaleAspectFit // .center
        
        self.addSubview(titleImageView)
        
        //magnifierTitleImageView.image = titleImageView.image as UIImage?

        
        optionsRowLengths = [optionsInputIDs.count] // unless specified from outside
        optionsTitles = optionsInputIDs
        
        optionWidth = frame.width
        
    }
    
    override func didMoveToSuperview() {
        updateButtonPosition()
    }
    
    override func layoutSubviews() {
         //NSLog("MFKB.layoutSubviews")
        super.layoutSubviews()
        setNeedsDisplay()
        updateButtonPosition()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // Only allow simultaneous recognition with our internal recognizers
        return (gestureRecognizer == panGestureRecognizer || gestureRecognizer == optionsViewRecognizer) && (otherGestureRecognizer == panGestureRecognizer || optionsViewRecognizer == optionsViewRecognizer)
    }
    
    override var description: String {
        let description = String(format: "<%@ %p>; frame = %@; input = %@; inputOptions = %@", String(describing: type(of:self)), self, String(describing: frame), inputID, optionsInputIDs)
        return description
    }
    
    
    func showMagnifier() {
         //NSLog("MFKB.showMagnifier()")
        if (sizeClass == .Phone) {
            //hideMagnifier()
            magnifier = MuFuKeyboardButtonDetailView(keyboardButton: self, newType: .Magnifier)
            // this of course invalidates all previous setup of the magnifier!!!
            magnifier!.titleType = titleType
            
            //magnifier?.titleImageView.image = magnifierTitleImageView.image
            window?.addSubview(magnifier!)
        } else {
            setNeedsDisplay()
        }
        
    }
    
    @objc func showOptions(recognizer: UILongPressGestureRecognizer) {
         //NSLog("MFKB.showOptions()")
        
        //hideMagnifier()
        
        if (recognizer.state == .began) {
            
            if (optionsView == nil) {
                
                let newOptionsView = MuFuKeyboardButtonDetailView(keyboardButton: self, newType: .Options)
                // again, all previous setup is now erased!!!
                newOptionsView.titleType = titleType
                
                window?.addSubview(newOptionsView)
                optionsView = newOptionsView
                NotificationCenter.default.post(name: .buttonDidShowInputOptions, object: self)
                
            }
            
        } else if (recognizer.state == .cancelled || recognizer.state == .ended) {
            
            if (panGestureRecognizer.state != .recognized) {
                handleTouchUpInside()
            }
            
        }
        
    }
    
    func hideMagnifier() {
         //NSLog("MFKB.hideMagnifier()")
        magnifier?.removeFromSuperview()
        magnifier = nil
        setNeedsDisplay()
    }
    
    func hideOptions() {
         //NSLog("MFKB.hideOptions()")
        if optionsView?.type == .Options {
            NotificationCenter.default.post(name: .buttonDidHideInputOptions, object: self)
        }
        
        optionsView?.removeFromSuperview()
        optionsView = nil
    }
    
    
    
    func updateButtonPosition() {
         //NSLog("MFKB.updateButtonPosition()")
        // Determine the button's position state based on the superview padding
        let leftPadding = frame.minX
        let rightPadding = (superview?.frame.maxX)! - frame.maxX
        let minimumClearance = frame.width * 0.5 + POSITION_CLEARANCE_PADDING
        
        if (leftPadding >= minimumClearance && rightPadding >= minimumClearance) {
            position = .Inner
        } else if (leftPadding > rightPadding) {
            position = .Right
        } else {
            position = .Left
        }
    }
    
    func setupOptionsConfiguration() {
         //NSLog("MFKB.setupOptionsConfiguration()")
        tearDownOptionsConfiguration()
        
        if (optionsInputIDs.count > 0) {
            //NSLog("--- optionsInputIDs.count > 0")
            let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showOptions(recognizer:)))
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
    
    func tearDownOptionsConfiguration() {
        //NSLog("MFKB.tearDownOptionsConfiguration()")
        removeGestureRecognizer(optionsViewRecognizer)
        removeGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func handleTouchDown() {
        UIDevice.current.playInputClick()
        if shouldShowMagnifier { showMagnifier() }
    }
    
    @objc func handleTouchUpInside() {
        delegate?.handleKeyboardEvent(inputID)
        if shouldShowMagnifier { hideMagnifier() } // since the touch ended
        hideOptions()
    }
    
    @objc func handleTouchUpOutside() {
        delegate?.handleKeyboardEvent(inputID)
        if shouldShowMagnifier { hideMagnifier() } // since the touch ended
        hideOptions()
    }
    
    @objc func handlePanning(recognizer: UIPanGestureRecognizer) {
        //NSLog("MFKB.handlePanning(recognizer:)")
        if (recognizer.state == .ended || recognizer.state == .cancelled) {
            if let idx = optionsView?.highlightedInputIndex {
                if idx != NSNotFound {
                    let inputOptionID = optionsInputIDs[idx]
                    delegate?.handleKeyboardEvent(inputOptionID)
                    if !titleIsPersistent {
                        inputID = optionsInputIDs[idx]
                        title = optionsTitles[idx]
                        titleImageView.image? = optionsImages[idx]
                        //magnifierTitleImageView.image? = optionsImages[idx]
                    }
                }
            }
            
            hideOptions()
            
        } else {
            let location = recognizer.location(in: superview)
            optionsView?.updateHighlightedInputIndex(forPoint: location)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        hideMagnifier()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        hideMagnifier()
    }
    
    override func draw(_ rect: CGRect) { // draw the button alone (without magnifier or options, but maybe highlighted)
        //NSLog("MFKB.draw(_)")
        let context = UIGraphicsGetCurrentContext()
        var fillColor = self.color
        if (sizeClass == .Tablet && state == .highlighted) {
            fillColor = highlightColor
        }
        
        let shadowOffset = CGSize(width: shadowXOffset, height: shadowYOffset)
        let shadowBlurRadius: CGFloat = 0.0
        
        let roundedRectanglePath = UIBezierPath(roundedRect: CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height - shadowYOffset), cornerRadius: cornerRadius)
        context?.saveGState()
        context?.setShadow(offset: shadowOffset, blur: shadowBlurRadius, color: shadowColor?.cgColor)
        fillColor?.setFill()
        roundedRectanglePath.fill()
        context?.restoreGState()
        
    }
    
    
    
}





// MARK: UIImage


extension UIImage {
    
    func padToSquare() -> UIImage {
        
        let sideLength = (size.width > size.height) ? size.width : size.height
        let newWidth = sideLength + 2 * IMAGE_PADDING
        let newHeight = sideLength + 2 * IMAGE_PADDING
        UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: newHeight), false, scale)
        _ = UIGraphicsGetCurrentContext()
        
        // Now we can draw anything we want into this new context.
        let origin = CGPoint(x: (newWidth - size.width) / 2.0,
                             y: (newHeight - size.height) / 2.0)
        draw(at: origin)
        
        // Clean up and get the new image.
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
        
    }
    
    func trim() -> UIImage {
        let newRect = self.cropRect
        if let imageRef = self.cgImage!.cropping(to: newRect) {
            return UIImage(cgImage: imageRef)
        }
        return self
    }
    
    var cropRect: CGRect {
        let cgImage = self.cgImage
        let context = createARGBBitmapContextFromImage(inImage: cgImage!)
        if context == nil {
            return CGRect.zero
        }
        
        let height = CGFloat(cgImage!.height)
        let width = CGFloat(cgImage!.width)
        
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        context?.draw(cgImage!, in: rect)
        
        guard let data = context?.data?.assumingMemoryBound(to: UInt8.self) else {
            return CGRect.zero
        }
        
        var lowX = width
        var lowY = height
        var highX: CGFloat = 0
        var highY: CGFloat = 0
        
        let heightInt = Int(height)
        let widthInt = Int(width)
        print("height: \(height)")
        print("width: \(width)")
        
        //Filter through data and look for non-transparent pixels.
        for y in (0 ..< heightInt) {
            let y = CGFloat(y)
            for x in (0 ..< widthInt) {
                let x = CGFloat(x)
                let pixelIndex = (width * y + x) * 4 /* 4 for A, R, G, B */
                
                let alpha =  data[Int(pixelIndex)]
                let red =  data[Int(pixelIndex + 1)]
                let green = data[Int(pixelIndex) + 2]
                let blue =  data[Int(pixelIndex + 3)]
                
                if (alpha != 255 && red != 255 && green != 255 && blue != 255) {
                    print("(\(x),\(y)) -> (\(alpha),\(red),\(green),\(blue))")
                }
                
                if data[Int(pixelIndex)] == 0  {
                    continue
                } // crop transparent
                
                
                if data[Int(pixelIndex+1)] > 0xE0 && data[Int(pixelIndex+2)] > 0xE0 && data[Int(pixelIndex+3)] > 0xE0 {
                    continue
                } // crop white
                
                
                if (x < lowX) {
                    lowX = x
                }
                if (x > highX) {
                    highX = x
                }
                if (y < lowY) {
                    lowY = y
                }
                if (y > highY) {
                    highY = y
                }
            }
        }
        
        // lowY -= 200
        // highY += 200
        print(lowX)
        print(highX)
        print(lowY)
        print(highY)
        
        let padding: CGFloat = 5.0
        
        //return CGRect(x: 0, y: 0, width: CGFloat(widthInt), height: highY + lowY)
        return CGRect(x: lowX - padding, y: lowY - padding, width: highX - lowX + 2.0 * padding, height: highY - lowY + 2.0 * padding)
    }
    
    func createARGBBitmapContextFromImage(inImage: CGImage) -> CGContext? {
        
        let width = inImage.width
        let height = inImage.height
        
        let bitmapBytesPerRow = width * 4
        let bitmapByteCount = bitmapBytesPerRow * height
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let bitmapData = malloc(bitmapByteCount)
        if bitmapData == nil {
            return nil
        }
        
        let context = CGContext (data: bitmapData,
                                 width: width,
                                 height: height,
                                 bitsPerComponent: 8,      // bits per component
            bytesPerRow: bitmapBytesPerRow,
            space: colorSpace,
            bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue)
        
        return context
    }
    
    convenience init?(imageName: String) {
        self.init(named: imageName)!
        accessibilityIdentifier = imageName
    }
    
    // http://stackoverflow.com/a/40177870/4488252
    func imageWithColor(newColor: UIColor?) -> UIImage? {
        
        if let newColor = newColor {
            UIGraphicsBeginImageContextWithOptions(size, false, scale)
            
            let context = UIGraphicsGetCurrentContext()!
            context.translateBy(x: 0, y: size.height)
            context.scaleBy(x: 1.0, y: -1.0)
            context.setBlendMode(.normal)
            
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            context.clip(to: rect, mask: cgImage!)
            
            newColor.setFill()
            context.fill(rect)
            
            let newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            newImage.accessibilityIdentifier = accessibilityIdentifier
            return newImage
        }
        
        if let accessibilityIdentifier = accessibilityIdentifier {
            return UIImage(imageName: accessibilityIdentifier)
        }
        
        return self
    }
    
    func inverted() -> UIImage? {
        guard let cgImage = self.cgImage else { return nil }
        let ciImage = CoreImage.CIImage(cgImage: cgImage)
        guard let filter = CIFilter(name: "CIColorInvert") else { return nil }
        filter.setDefaults()
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        let context = CIContext(options: nil)
        guard let outputImage = filter.outputImage else { return nil }
        guard let outputImageCopy = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
        return UIImage(cgImage: outputImageCopy)
    }
    
}


























