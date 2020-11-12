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
import AudioToolbox
import CoreGraphics

let IPHONE5_PORTRAIT_BUTTON_WIDTH: CGFloat = 24.0
let IPHONE5_PORTRAIT_BUTTON_HEIGHT: CGFloat = 38.0
let IPHONE5_PORTRAIT_OPTION_WIDTH: CGFloat = 24.0
let IPHONE5_PORTRAIT_OPTION_HEIGHT: CGFloat = 38.0
let IPHONE5_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 3.0
let IPHONE5_PORTRAIT_BUTTON_X_GAP: CGFloat = 5.0
let IPHONE5_PORTRAIT_BUTTON_Y_GAP: CGFloat = 16.0


let IPHONE5_LANDSCAPE_BUTTON_WIDTH: CGFloat = 47.0
let IPHONE5_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 32.0
let IPHONE5_LANDSCAPE_OPTION_WIDTH: CGFloat = 47.0
let IPHONE5_LANDSCAPE_OPTION_HEIGHT: CGFloat = 32.0

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


let IPHONEX_LANDSCAPE_BUTTON_WIDTH: CGFloat = 30.0
let IPHONEX_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 39.0
let IPHONEX_LANDSCAPE_OPTION_WIDTH: CGFloat = 20.0
let IPHONEX_LANDSCAPE_OPTION_HEIGHT: CGFloat = 20.0
let IPHONEX_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPHONEX_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPHONEX_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0



let IPHONEXR_PORTRAIT_BUTTON_WIDTH: CGFloat = 28.0
let IPHONEXR_PORTRAIT_BUTTON_HEIGHT: CGFloat = 42.0
let IPHONEXR_PORTRAIT_OPTION_WIDTH: CGFloat = 28.0
let IPHONEXR_PORTRAIT_OPTION_HEIGHT: CGFloat = 42.0
let IPHONEXR_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 3.0
let IPHONEXR_PORTRAIT_BUTTON_X_GAP: CGFloat = 6.0
let IPHONEXR_PORTRAIT_BUTTON_Y_GAP: CGFloat = 12.0


let IPHONEXR_LANDSCAPE_BUTTON_WIDTH: CGFloat = 30.0
let IPHONEXR_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 39.0
let IPHONEXR_LANDSCAPE_OPTION_WIDTH: CGFloat = 20.0
let IPHONEXR_LANDSCAPE_OPTION_HEIGHT: CGFloat = 20.0
let IPHONEXR_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPHONEXR_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPHONEXR_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0



let IPHONE12_PORTRAIT_BUTTON_WIDTH: CGFloat = 28.0
let IPHONE12_PORTRAIT_BUTTON_HEIGHT: CGFloat = 42.0
let IPHONE12_PORTRAIT_OPTION_WIDTH: CGFloat = 28.0
let IPHONE12_PORTRAIT_OPTION_HEIGHT: CGFloat = 42.0
let IPHONE12_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 3.0
let IPHONE12_PORTRAIT_BUTTON_X_GAP: CGFloat = 6.0
let IPHONE12_PORTRAIT_BUTTON_Y_GAP: CGFloat = 12.0


let IPHONE12_LANDSCAPE_BUTTON_WIDTH: CGFloat = 30.0
let IPHONE12_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 39.0
let IPHONE12_LANDSCAPE_OPTION_WIDTH: CGFloat = 20.0
let IPHONE12_LANDSCAPE_OPTION_HEIGHT: CGFloat = 20.0
let IPHONE12_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPHONE12_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPHONE12_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0



let IPHONE12MINI_PORTRAIT_BUTTON_WIDTH: CGFloat = 28.0
let IPHONE12MINI_PORTRAIT_BUTTON_HEIGHT: CGFloat = 42.0
let IPHONE12MINI_PORTRAIT_OPTION_WIDTH: CGFloat = 28.0
let IPHONE12MINI_PORTRAIT_OPTION_HEIGHT: CGFloat = 42.0
let IPHONE12MINI_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 3.0
let IPHONE12MINI_PORTRAIT_BUTTON_X_GAP: CGFloat = 6.0
let IPHONE12MINI_PORTRAIT_BUTTON_Y_GAP: CGFloat = 12.0


let IPHONE12MINI_LANDSCAPE_BUTTON_WIDTH: CGFloat = 30.0
let IPHONE12MINI_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 39.0
let IPHONE12MINI_LANDSCAPE_OPTION_WIDTH: CGFloat = 20.0
let IPHONE12MINI_LANDSCAPE_OPTION_HEIGHT: CGFloat = 20.0
let IPHONE12MINI_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPHONE12MINI_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPHONE12MINI_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0



let IPHONE12PROMAX_PORTRAIT_BUTTON_WIDTH: CGFloat = 34.0
let IPHONE12PROMAX_PORTRAIT_BUTTON_HEIGHT: CGFloat = 45.0
let IPHONE12PROMAX_PORTRAIT_OPTION_WIDTH: CGFloat = 34.0
let IPHONE12PROMAX_PORTRAIT_OPTION_HEIGHT: CGFloat = 45.0
let IPHONE12PROMAX_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 3.0
let IPHONE12PROMAX_PORTRAIT_BUTTON_X_GAP: CGFloat = 6.0
let IPHONE12PROMAX_PORTRAIT_BUTTON_Y_GAP: CGFloat = 11.0


let IPHONE12PROMAX_LANDSCAPE_BUTTON_WIDTH: CGFloat = 30.0
let IPHONE12PROMAX_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 39.0
let IPHONE12PROMAX_LANDSCAPE_OPTION_WIDTH: CGFloat = 20.0
let IPHONE12PROMAX_LANDSCAPE_OPTION_HEIGHT: CGFloat = 20.0
let IPHONE12PROMAX_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPHONE12PROMAX_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPHONE12PROMAX_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0






let IPAD_AIR_PORTRAIT_BUTTON_WIDTH: CGFloat = 49.0
let IPAD_AIR_PORTRAIT_BUTTON_HEIGHT: CGFloat = 57.0
let IPAD_AIR_PORTRAIT_OPTION_WIDTH: CGFloat = 49.0
let IPAD_AIR_PORTRAIT_OPTION_HEIGHT: CGFloat = 57.0
let IPAD_AIR_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 6.0
let IPAD_AIR_PORTRAIT_BUTTON_X_GAP: CGFloat = 12.0
let IPAD_AIR_PORTRAIT_BUTTON_Y_GAP: CGFloat = 9.0


let IPAD_AIR_LANDSCAPE_BUTTON_WIDTH: CGFloat = 57.0
let IPAD_AIR_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 55.0
let IPAD_AIR_LANDSCAPE_OPTION_WIDTH: CGFloat = 50.0
let IPAD_AIR_LANDSCAPE_OPTION_HEIGHT: CGFloat = 50.0
let IPAD_AIR_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPAD_AIR_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPAD_AIR_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0



let IPAD7_PORTRAIT_BUTTON_WIDTH: CGFloat = 49.0
let IPAD7_PORTRAIT_BUTTON_HEIGHT: CGFloat = 57.0
let IPAD7_PORTRAIT_OPTION_WIDTH: CGFloat = 49.0
let IPAD7_PORTRAIT_OPTION_HEIGHT: CGFloat = 57.0
let IPAD7_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 6.0
let IPAD7_PORTRAIT_BUTTON_X_GAP: CGFloat = 12.0
let IPAD7_PORTRAIT_BUTTON_Y_GAP: CGFloat = 9.0


let IPAD7_LANDSCAPE_BUTTON_WIDTH: CGFloat = 57.0
let IPAD7_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 55.0
let IPAD7_LANDSCAPE_OPTION_WIDTH: CGFloat = 50.0
let IPAD7_LANDSCAPE_OPTION_HEIGHT: CGFloat = 50.0
let IPAD7_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPAD7_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPAD7_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0



let IPAD_PRO10_PORTRAIT_BUTTON_WIDTH: CGFloat = 53.5
let IPAD_PRO10_PORTRAIT_BUTTON_HEIGHT: CGFloat = 57.0
let IPAD_PRO10_PORTRAIT_OPTION_WIDTH: CGFloat = 53.5
let IPAD_PRO10_PORTRAIT_OPTION_HEIGHT: CGFloat = 57.0
let IPAD_PRO10_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 6.5
let IPAD_PRO10_PORTRAIT_BUTTON_X_GAP: CGFloat = 12.5
let IPAD_PRO10_PORTRAIT_BUTTON_Y_GAP: CGFloat = 9.0


let IPAD_PRO10_LANDSCAPE_BUTTON_WIDTH: CGFloat = 57.0
let IPAD_PRO10_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 55.0
let IPAD_PRO10_LANDSCAPE_OPTION_WIDTH: CGFloat = 50.0
let IPAD_PRO10_LANDSCAPE_OPTION_HEIGHT: CGFloat = 50.0
let IPAD_PRO10_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPAD_PRO10_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPAD_PRO10_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0



let IPAD_PRO11_PORTRAIT_BUTTON_WIDTH: CGFloat = 56.0
let IPAD_PRO11_PORTRAIT_BUTTON_HEIGHT: CGFloat = 60.0
let IPAD_PRO11_PORTRAIT_OPTION_WIDTH: CGFloat = 56.0
let IPAD_PRO11_PORTRAIT_OPTION_HEIGHT: CGFloat = 60.0
let IPAD_PRO11_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 4.0
let IPAD_PRO11_PORTRAIT_BUTTON_X_GAP: CGFloat = 10.0
let IPAD_PRO11_PORTRAIT_BUTTON_Y_GAP: CGFloat = 8.0


let IPAD_PRO11_LANDSCAPE_BUTTON_WIDTH: CGFloat = 57.0
let IPAD_PRO11_LANDSCAPE_BUTTON_HEIGHT: CGFloat = 55.0
let IPAD_PRO11_LANDSCAPE_OPTION_WIDTH: CGFloat = 50.0
let IPAD_PRO11_LANDSCAPE_OPTION_HEIGHT: CGFloat = 50.0
let IPAD_PRO11_LANDSCAPE_BUTTON_X_OFFSET: CGFloat = 10.0
let IPAD_PRO11_LANDSCAPE_BUTTON_X_GAP: CGFloat = 3.0
let IPAD_PRO11_LANDSCAPE_BUTTON_Y_GAP: CGFloat = 3.0



let IPAD_PRO12_PORTRAIT_BUTTON_WIDTH: CGFloat = 58.0
let IPAD_PRO12_PORTRAIT_BUTTON_HEIGHT: CGFloat = 63.0
let IPAD_PRO12_PORTRAIT_OPTION_WIDTH: CGFloat = 58.0
let IPAD_PRO12_PORTRAIT_OPTION_HEIGHT: CGFloat = 63.0
let IPAD_PRO12_PORTRAIT_BUTTON_X_OFFSET: CGFloat = 4.0
let IPAD_PRO12_PORTRAIT_BUTTON_X_GAP: CGFloat = 7.0
let IPAD_PRO12_PORTRAIT_BUTTON_Y_GAP: CGFloat = 7.0


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

let DEFAULT_KEY_COLOR_LIGHT: UIColor = .white
let DEFAULT_KEY_COLOR_DARK: UIColor = UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 101.0/255.0, alpha: 1.0)
@available(iOS 13.0, *)
let DYNAMIC_DEFAULT_KEY_COLOR = UIColor { (traitCollection: UITraitCollection) -> UIColor in
    if traitCollection.userInterfaceStyle == .dark {
        return DEFAULT_KEY_COLOR_DARK
    } else {
        return DEFAULT_KEY_COLOR_LIGHT
    }
}

let DEFAULT_FONT_COLOR_LIGHT: UIColor = .black
let DEFAULT_FONT_COLOR_DARK: UIColor = .white
@available(iOS 13.0, *)
let DYNAMIC_DEFAULT_FONT_COLOR = UIColor { (traitCollection: UITraitCollection) -> UIColor in
    if traitCollection.userInterfaceStyle == .dark {
        return DEFAULT_FONT_COLOR_DARK
    } else {
        return DEFAULT_FONT_COLOR_LIGHT
    }
}



let DEFAULT_SHADOW_COLOR_LIGHT: UIColor = UIColor.black.withAlphaComponent(0.5)
let DEFAULT_SHADOW_COLOR_DARK: UIColor = .black
@available(iOS 13.0, *)
let DYNAMIC_DEFAULT_SHADOW_COLOR = UIColor { (traitCollection: UITraitCollection) -> UIColor in
    if traitCollection.userInterfaceStyle == .dark {
        return DEFAULT_SHADOW_COLOR_DARK
    } else {
        return DEFAULT_SHADOW_COLOR_LIGHT
    }
}

let DEFAULT_BORDER_COLOR: UIColor = .clear

let DEFAULT_HIGHLIGHT_COLOR_LIGHT: UIColor = UIColor(red: 174.0/255.0, green: 179.0/255.0, blue: 190.0/255.0, alpha: 1.0)
let DEFAULT_HIGHLIGHT_COLOR_DARK: UIColor = UIColor(red: 174.0/255.0, green: 179.0/255.0, blue: 190.0/255.0, alpha: 1.0)
@available(iOS 13.0, *)
let DYNAMIC_DEFAULT_HIGHLIGHT_COLOR = UIColor { (traitCollection: UITraitCollection) -> UIColor in
    if traitCollection.userInterfaceStyle == .dark {
        return DEFAULT_HIGHLIGHT_COLOR_DARK
    } else {
        return DEFAULT_HIGHLIGHT_COLOR_LIGHT
    }
}

let DEFAULT_OPTION_HIGHLIGHT_COLOR_LIGHT: UIColor = UIColor(red: 21.0/255.0, green: 126.0/255.0, blue: 251.0/255.0, alpha: 1.0)
let DEFAULT_OPTION_HIGHLIGHT_COLOR_DARK: UIColor = UIColor(red: 21.0/255.0, green: 126.0/255.0, blue: 251.0/255.0, alpha: 1.0)
@available(iOS 13.0, *)
let DYNAMIC_DEFAULT_OPTION_HIGHLIGHT_COLOR = UIColor { (traitCollection: UITraitCollection) -> UIColor in
    if traitCollection.userInterfaceStyle == .dark {
        return DEFAULT_OPTION_HIGHLIGHT_COLOR_DARK
    } else {
        return DEFAULT_OPTION_HIGHLIGHT_COLOR_LIGHT
    }
}

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


@objc protocol MFKBDelegate { // is the KeyboardViewController
    func handleKeyboardEvent(_ id: String, save: Bool)
    func log(_ string: String)
    func optionsShown(for: MuFuKeyboardButton)
    func optionsHidden(for: MuFuKeyboardButton)
    var isTypingText: Bool { get set }
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
        returnValue.isPortrait = UIDevice.current.orientation.isPortrait // was true
        return returnValue
    }
    
    var titleLabel = UILabel()
    var titleImageView = UIImageView()
    
    var titleImage: UIImage? {
        get { return titleImageView.image }
        set {
            titleImageView.image = newValue
            magnifier?.titleImageView = magnifierTitleImageView
        }
    }
    
    var invertImageInDarkMode: Bool = false
    
    var titleIsPersistent: Bool = true // false means: displayed label/image changes to last selected option
    
    var optionsArePersistent: Bool = false // for the roman letter key
    
    var shouldPlaySound: Bool = true
    var soundID: SystemSoundID = 1123 // standard keyboard click sound
    
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
    
    var color: UIColor? = DEFAULT_KEY_COLOR_LIGHT { // the key's background color
    // the existing backgroundColor has to remain clear so we can have round corners
    // no it doesn't if we use the built-in corner rounding on the layer
        didSet {
            backgroundColor = self.color
//            if (inputID == "Shift") {
//                delegate?.log("color was set to")
//                delegate?.log(backgroundColor.debugDescription)
//            }
        }
    }
    
        
    var borderColor: UIColor = DEFAULT_BORDER_COLOR
    var shadowColor: UIColor? = DEFAULT_SHADOW_COLOR_LIGHT
    var highlightColor: UIColor? = DEFAULT_HIGHLIGHT_COLOR_LIGHT
    var optionHighlightColor: UIColor? = DEFAULT_OPTION_HIGHLIGHT_COLOR_LIGHT
    
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
    
    var pressTimer: Timer?
    
    var fireRepeatedlyOnHold: Bool = false {
        didSet {
            setupLongPressConfiguration()
        }
    }
    
    var optionsTitles: Array<String> = [] // will by default be set to the optionInputIDs
    
    var optionsImages: Array<UIImage> = [] {
        didSet {
            updateHighlightedOptionImages()
        }
    }
    
    var invertImagesOnHighlighting: Bool = true
    
    func updateHighlightedOptionImages() {
        highlightedOptionsImages = []
        for inputOptionImage: UIImage in optionsImages {
            if #available(iOS 13, *) {
                if (traitCollection.userInterfaceStyle == .dark  || !invertImagesOnHighlighting) {
                    highlightedOptionsImages.append(inputOptionImage)
                } else {
                    highlightedOptionsImages.append(inputOptionImage.inverted())
                }
            } else {
                if (invertImagesOnHighlighting) {
                    highlightedOptionsImages.append(inputOptionImage.inverted())
                } else {
                    highlightedOptionsImages.append(inputOptionImage)
                }
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
    lazy var longPressRecognizer = UILongPressGestureRecognizer()
    
    var optionsViewDelay = Float(DEFAULT_OPTIONS_VIEW_DELAY)
    var optionsRowLengths: [Int] = [0]
    var optionsRowOffsets: [CGFloat] = [0.0]
    
    weak var delegate: MFKBDelegate?
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
        titleImageView.contentMode = .center
    }
    
    init() {
        let frame = CGRect(x:0.0, y:0.0, width: DEFAULT_BUTTON_WIDTH, height: DEFAULT_BUTTON_HEIGHT)
        sizeClass = .Phone
        titleType = .Label
        position = .Inner
        optionWidth = 0.0
        super.init(frame: frame)
        commonInit()
    }
    
    override init(frame: CGRect) {
        sizeClass = .Phone
        titleType = .Label
        position = .Inner
        optionWidth = 0.0
        super.init(frame: frame)
        commonInit()
    }
    
    init(x: CGFloat, y: CGFloat, style: MuFuKeyboardButtonSizeClass) {
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
        switch (screenGeometry.interfaceIdiom, screenGeometry.screenSize, screenGeometry.isPortrait) {
            
        case (.phone, 568.0,true): // iPhone 5,5C,5S,SE1 Portrait
            sizeClass = .Phone
            self.frame.size.width = IPHONE5_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPHONE5_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone, 568.0,false): // iPhone 5,5C,5S,SE1 Landscape
            sizeClass = .Phone
            self.frame.size.width = IPHONE5_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPHONE5_LANDSCAPE_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone, 667.0, true): // iPhone 6,6S,7,8, SE2 Portrait
            sizeClass = .Phone
            self.frame.size.width = IPHONE6_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPHONE6_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone, 667.0, false): // iPhone 6,6S,,SE2 Landscape
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
            
        case (.phone,812.0,true): // iPhone X, XS, 11 Pro Portrait
            sizeClass = .Phone
            self.frame.size.width = IPHONEX_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPHONEX_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone,812.0,false): // iPhone X, XS, 11 Pro Landscape
            sizeClass = .Phone
            self.frame.size.width = IPHONEX_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPHONEX_LANDSCAPE_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
            
        case (.phone,896.0,true): // iPhone XR, XSMax, 11, Pro Max Portrait
            sizeClass = .Phone
            self.frame.size.width = IPHONEX_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPHONEX_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone,896.0,false): // iPhone XR, XSMax, 11, Pro Max Landscape
            sizeClass = .Phone
            self.frame.size.width = IPHONEX_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPHONEX_LANDSCAPE_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone,844.0,true): // iPhone 12, 12 Pro Portrait
            sizeClass = .Phone
            self.frame.size.width = IPHONE12_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPHONE12_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone,844.0,false): // iPhone 12, 12 Pro Landscape
            sizeClass = .Phone
            self.frame.size.width = IPHONE12_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPHONE12_LANDSCAPE_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone,780.0,true): // iPhone 12 mini Portrait
            sizeClass = .Phone
            self.frame.size.width = IPHONE12MINI_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPHONE12MINI_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone,780.0,false): // iPhone 12 mini Landscape
            sizeClass = .Phone
            self.frame.size.width = IPHONE12MINI_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPHONE12MINI_LANDSCAPE_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone,926.0,true): // iPhone 12 Pro Max Portrait
            sizeClass = .Phone
            self.frame.size.width = IPHONE12PROMAX_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPHONE12PROMAX_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
            break
            
        case (.phone,926.0,false): // iPhone 12 Pro Max Landscape
            sizeClass = .Phone
            self.frame.size.width = IPHONE12PROMAX_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPHONE12PROMAX_LANDSCAPE_BUTTON_HEIGHT
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
            
        case (.pad,1194.0,true): // iPad Pro 11" Portrait
            sizeClass = .Tablet
            self.frame.size.width = IPAD_PRO11_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPAD_PRO11_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPAD_KEY_CORNER_RADIUS
            break
            
        case (.pad,1194.0,false): // iPad Pro 11" Landscape
            sizeClass = .Tablet
            self.frame.size.width = IPAD_PRO11_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPAD_PRO11_LANDSCAPE_BUTTON_HEIGHT
            cornerRadius = IPAD_KEY_CORNER_RADIUS
            break
            
        case (.pad,1080.0,true): // iPad 7th gen Portrait
            sizeClass = .Tablet
            self.frame.size.width = IPAD7_PORTRAIT_BUTTON_WIDTH
            self.frame.size.height = IPAD7_PORTRAIT_BUTTON_HEIGHT
            cornerRadius = IPAD_KEY_CORNER_RADIUS
            break
            
        case (.pad,1080.0,false): // iPad 7th gen Landscape
            sizeClass = .Tablet
            self.frame.size.width = IPAD7_LANDSCAPE_BUTTON_WIDTH
            self.frame.size.height = IPAD7_LANDSCAPE_BUTTON_HEIGHT
            cornerRadius = IPAD_KEY_CORNER_RADIUS
            break
            
            
        default:
            delegate?.log("failed to identify screen geometry")
            break
        }
        
    }

    func updateColors() { // for dark mode
        if (state == .highlighted) {
            backgroundColor = highlightColor
        } else {
            backgroundColor = self.color
        }
    }
    
    func commonInit() {
        setupAppearanceFromDevice()
        
        clipsToBounds = false
        layer.masksToBounds = false
        contentHorizontalAlignment = .center
        
        // State handling
        addTarget(self, action: #selector(MuFuKeyboardButton.handleTouchDown), for: .touchDown)
        addTarget(self, action: #selector(MuFuKeyboardButton.handleTouchUpInside), for: .touchUpInside)
        addTarget(self, action: #selector(MuFuKeyboardButton.handleTouchUpOutside), for: .touchUpOutside)
        
        titleLabel.frame = self.bounds
        titleLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        titleLabel.textAlignment = .center
        titleLabel.isUserInteractionEnabled = false
        
        if #available(iOS 13, *) {
            titleColor = DYNAMIC_DEFAULT_FONT_COLOR
            self.color = DYNAMIC_DEFAULT_KEY_COLOR
            highlightColor = DYNAMIC_DEFAULT_HIGHLIGHT_COLOR
        } else {
            titleColor = DEFAULT_FONT_COLOR_LIGHT
            self.color = DEFAULT_KEY_COLOR_LIGHT
            highlightColor = DEFAULT_HIGHLIGHT_COLOR_LIGHT
        }
        layer.shadowColor = shadowColor?.cgColor
        
        self.addSubview(titleLabel)
        
        titleImageView.frame = self.bounds
        
        titleImageView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        
        titleImageView.backgroundColor = .clear
        titleImageView.isUserInteractionEnabled = false
        titleImageView.contentMode = .center
        
        self.addSubview(titleImageView)
        
        optionsRowLengths = [optionsInputIDs.count] // unless specified from outside
        optionsTitles = optionsInputIDs
        
        optionWidth = frame.width
        
        layer.cornerRadius = cornerRadius
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        isOpaque = true
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            layer.shadowRadius = DEFAULT_IPHONE_SHADOW_BLUR_RADIUS
            layer.shadowOffset = DEFAULT_IPHONE_ROOT_SHADOW_OFFSET
        case .pad:
            layer.shadowRadius = DEFAULT_IPAD_SHADOW_BLUR_RADIUS
            layer.shadowOffset = DEFAULT_IPAD_ROOT_SHADOW_OFFSET
        default:
            layer.shadowRadius = DEFAULT_IPHONE_SHADOW_BLUR_RADIUS
            layer.shadowOffset = DEFAULT_IPHONE_ROOT_SHADOW_OFFSET
        }
        
        if (state == .highlighted) {
            backgroundColor = highlightColor
        } else {
            backgroundColor = self.color
        }
        
        if (soundID == 1123) {
            if #available(iOS 10.0, *) { } else {
                soundID = 1104
            }
        }
    }
    
    func playSound() {
        if (shouldPlaySound) {
            DispatchQueue.global().async {
                AudioServicesPlaySystemSound(self.soundID)
            }
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
        updateTitle(inputID)
        updateHighlightedOptionImages()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        updateButtonPosition()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateButtonPosition()
        contentMode = .redraw
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
        if (sizeClass == .Phone) {
            magnifier = MuFuKeyboardButtonDetailView(keyboardButton: self, newType: .Magnifier)
            // this of course invalidates all previous setup of the magnifier!!!
            magnifier!.titleType = titleType
            window?.addSubview(magnifier!)
        } else {
            //setNeedsDisplay()
        }
        
    }
    
    @objc func showOptions(recognizer: UILongPressGestureRecognizer) {
        
        if (recognizer.state == .began) {
            
            if (optionsView == nil) {
                
                let newOptionsView = MuFuKeyboardButtonDetailView(keyboardButton: self, newType: .Options)
                // again, all previous setup is now erased!!!
                newOptionsView.titleType = titleType
            
                window?.addSubview(newOptionsView)
                optionsView = newOptionsView
                NotificationCenter.default.post(name: .buttonDidShowInputOptions, object: self)
                
                delegate?.optionsShown(for: self)
                
            }
            
        } else if (recognizer.state == .cancelled || recognizer.state == .ended) {
            
            if (panGestureRecognizer.state != .recognized) {
                handleTouchUpInside()
            }
            
        }
    
    }
    
    func hideMagnifier() {
        magnifier?.removeFromSuperview()
        magnifier = nil
    }
    
    func hideOptions() {
        delegate?.optionsHidden(for: self)
        if optionsView?.type == .Options {
            NotificationCenter.default.post(name: .buttonDidHideInputOptions, object: self)
        }
        optionsView?.removeFromSuperview()
        optionsView = nil
    }
    
    func updateButtonPosition() {
        // Determine the button's position state based on the superview padding
        let leftPadding = frame.minX
        let rightPadding: CGFloat = (superview?.frame.maxX ?? 0.0) - frame.maxX
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
        tearDownOptionsConfiguration()
        
        if (optionsInputIDs.count > 0) {
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
        removeGestureRecognizer(optionsViewRecognizer)
        removeGestureRecognizer(panGestureRecognizer)
    }
    
    func setupLongPressConfiguration() {
        tearDownLongPressConfiguration()
        longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressRecognizer.minimumPressDuration = CFTimeInterval(optionsViewDelay)
        longPressRecognizer.delegate = self
        addGestureRecognizer(longPressRecognizer)
    }
    
    func tearDownLongPressConfiguration() {
        removeGestureRecognizer(longPressRecognizer)
    }
    
    @objc func handleLongPress(recognizer: UILongPressGestureRecognizer) {
        if (recognizer.state == .began) {
            pressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(fireKey), userInfo: nil, repeats: true)
        } else if (recognizer.state == .ended) {
            pressTimer?.invalidate()
            handleTouchUpInside()
        }
    }
    
    @objc func fireKey() {
        delegate?.handleKeyboardEvent(inputID, save: true)
    }
    
    @objc func handleTouchDown() {
        // UIDevice.current.playInputClick() // can't get it to work, so we roll our own
        if (!optionsArePersistent) {
            playSound()
        }
        if shouldShowMagnifier { showMagnifier() }
    }
    
    @objc func handleTouchUpInside() {
        if (optionsView == nil) { delegate?.handleKeyboardEvent(inputID, save: true) }
        if shouldShowMagnifier { hideMagnifier() } // since the touch ended
        backgroundColor = self.color
        setNeedsDisplay()
        //hideOptions()
    }
    
    @objc func handleTouchUpOutside() {
        delegate?.handleKeyboardEvent(inputID, save: true)
        if shouldShowMagnifier { hideMagnifier() } // since the touch ended
        backgroundColor = self.color
        setNeedsDisplay()
        hideOptions()
    }
    
    func updateTitle(_ id: String) {
        if titleIsPersistent { return }
        inputID = id
        if let idx = optionsInputIDs.firstIndex(of: id) {
            if idx != NSNotFound {
                title = optionsTitles[idx]
                if optionsImages.count > 0 {
                    titleImage = optionsImages[idx]

                }
            }
        }
    }
    
    @objc func handlePanning(recognizer: UIPanGestureRecognizer) {
        
        if (recognizer.state == .ended || recognizer.state == .cancelled) {
            delegate?.log(optionsImages.debugDescription)
            backgroundColor = self.color
            if let idx = optionsView?.highlightedInputIndex {
                if idx != NSNotFound {
                    let inputOptionID = optionsInputIDs[idx]
                    delegate?.handleKeyboardEvent(inputOptionID, save: true)
                    if (optionsArePersistent) {
                        playSound()
                    }
                    if !titleIsPersistent {
                        inputID = optionsInputIDs[idx]
                        updateTitle(optionsTitles[idx])
                        if optionsImages.count > 0 {
                            titleImage = optionsImages[idx]
                        }
                    }

                    optionsView?.previouslyHighlightedInputIndex = (optionsView?.highlightedInputIndex)!
                    optionsView?.highlightedInputIndex = NSNotFound
                    optionsView?.drawInputOptionView(for: (optionsView?.previouslyHighlightedInputIndex)!)
                    optionsView?.drawInputOptionView(for: (optionsView?.highlightedInputIndex)!)
                } else {
                    // pan ended on whitespace: don't collapse the options view
                    return
                }
            }


            if !optionsArePersistent {
                hideOptions()
            } else { // typing text

                if (optionsArePersistent && !(delegate?.isTypingText)!) {
                    delegate?.isTypingText = true
                    delegate?.handleKeyboardEvent("mathrm", save: true)
                }

                optionsView?.highlightedInputIndex = NSNotFound
            }

            setNeedsDisplay()
            
        } else {
            let location = recognizer.location(in: superview)
            optionsView?.updateHighlightedInputIndex(forPoint: location)
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        hideMagnifier()
        hideOptions()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        hideMagnifier()
    }
    
}




