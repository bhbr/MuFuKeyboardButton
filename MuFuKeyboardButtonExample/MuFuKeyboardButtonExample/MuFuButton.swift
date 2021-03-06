//
//  MuFuButton.swift
//  MuFuKeyboardButtonExample
//
//  Created by Ben Hambrecht on 12.03.17.
//  Copyright © 2017 Ben Hambrecht. All rights reserved.
//


import UIKit

extension UIColor {
    
    func getRGBAComponents() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)?
    {
        var (red, green, blue, alpha) = (CGFloat(0.0), CGFloat(0.0), CGFloat(0.0), CGFloat(0.0))
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        {
            return (red, green, blue, alpha)
        }
        else
        {
            return nil
        }
    }
    
}

extension UIImage {
    
    
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
    
    func tintedImage(color: UIColor) -> UIImage? {
        // colors the whole image in the same color (preserves alpha)
        guard let cgImage = self.cgImage else { return nil }
        let ciImage = CoreImage.CIImage(cgImage: cgImage)
        guard let filter = CIFilter(name: "CIColorPolynomial") else { return nil }
        filter.setDefaults()
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        
        // let ciColor = CIColor(color: color)
        //var red = ciColor.red > 0 ? ciColor.red : 0 - ciColor.red
        //var green = ciColor.green > 0 ? ciColor.green : 0 - ciColor.green
        //var blue = ciColor.blue > 0 ? ciColor.blue : 0 - ciColor.blue
        
        let (red, green, blue, _) = color.getRGBAComponents()!
        
        let redVector = CIVector(x: red, y: 0, z: 0, w: 0)
        let greenVector = CIVector(x: green, y: 0, z: 0, w: 0)
        let blueVector = CIVector(x: blue, y: 0, z: 0, w: 0)
        let alphaVector = CIVector(x: 0, y: 1, z: 0, w: 0)
        
        filter.setValue(redVector, forKey: "inputRedCoefficients")
        filter.setValue(greenVector, forKey: "inputGreenCoefficients")
        filter.setValue(blueVector, forKey: "inputBlueCoefficients")
        filter.setValue(alphaVector, forKey: "inputAlphaCoefficients")
        
        let context = CIContext(options: nil)
        guard let outputImage = filter.outputImage else { return nil }
        
        let scale: CGFloat = self.size.width / outputImage.extent.size.width
        NSLog(self.size.width.description)
        NSLog(outputImage.debugDescription)
        
        let scalingTransform = CGAffineTransform(scaleX: scale, y: scale)
        
        guard let outputImageCopy = context.createCGImage(outputImage.applying(scalingTransform), from: outputImage.extent) else { return nil }
        let cropRect = CGRect(x: 0, y: (1 - scale) * outputImage.extent.height, width: scale * outputImage.extent.width, height: scale * outputImage.extent.height)
        guard let croppedOutputImage = outputImageCopy.cropping(to: cropRect) else { return nil }
        let scaledOutputImage = UIImage(cgImage: croppedOutputImage)
        
        return scaledOutputImage
        
    }
}


protocol MuFuKeyDelegate { // is the KeyboardViewController
    func handleKeyboardEvent(_ id: String)
}

// Constants

let CHARACTER_KEY_BG_COLOR: UIColor = .white
let CHARACTER_KEY_TEXT_COLOR: UIColor = .black
let CHARACTER_KEY_HIGHLIGHT_BG_COLOR: UIColor = .white
let CHARACTER_KEY_HIGHLIGHT_TEXT_COLOR: UIColor = .white

let CHARACTER_KEY_FONT: UIFont = UIFont.systemFont(ofSize: 22.0)

let FUNCTION_KEY_BG_COLOR = UIColor(red: 174.0/255.0, green: 179.0/255.0, blue: 189.0/255.0, alpha: 1.0)
let FUNCTION_KEY_TEXT_COLOR: UIColor = .black
let FUNCTION_KEY_HIGHLIGHT_BG_COLOR: UIColor = .white
let FUNCTION_KEY_HIGHLIGHT_TEXT_COLOR: UIColor = .black

let FUNCTION_KEY_FONT: UIFont = UIFont.systemFont(ofSize: 22.0)

let BUTTON_SHADOW_COLOR = UIColor(red: 137.0/255.0, green: 139.0/255.0, blue: 143.0/255.0, alpha: 1.0)

let IPHONE_KEY_CORNER_RADIUS: CGFloat = 4.0
let IPAD_KEY_CORNER_RADIUS: CGFloat = 4.0


let DEFAULT_OPTIONS_VIEW_DELAY: Float = 0.3


enum MuFuKeyboardButtonPopoverDirection { // which way the option selection fans out
    case Left
    case Inner
    case Right
}

enum MuFuKeySymbolType {
    case Text
    case Image
}


@IBDesignable class MuFuKey: UIControl {
    
    @IBInspectable var style: String? = "Character" {
        didSet {
            switch style! {
            case "Character":
                setupAsCharacterKey()
            case "Function":
                setupAsFunctionKey()
            default:
                break
            }
        }
    }
    
    // Colors
    @IBInspectable var normalColor: UIColor? = CHARACTER_KEY_BG_COLOR
    @IBInspectable var highlightColor: UIColor? = CHARACTER_KEY_HIGHLIGHT_BG_COLOR
    
    @IBInspectable var normalTextColor: UIColor? = CHARACTER_KEY_TEXT_COLOR
    @IBInspectable var highlightTextColor: UIColor? = CHARACTER_KEY_HIGHLIGHT_TEXT_COLOR

    
    
    
    // Symbol
    var symbolView: UIView?
    var symbolType: MuFuKeySymbolType? {
        if symbolView is UILabel {
            return .Text
        }
        else if symbolView is UIImageView {
            return .Image
        } else {
            return nil
        }
    }
    
    
    @IBInspectable var symbolImage: UIImage? {
        didSet {
            setupSymbolViewAsImage()
        }
    }
    
    @IBInspectable var symbolFont: UIFont? = CHARACTER_KEY_FONT
    
    @IBInspectable var symbolText: String? {
        didSet {
            setupSymbolViewAsLabel()
        }
    }

    var highlightedSymbolView: UIView? // precomputed in init

    @IBInspectable var cornerRadius: CGFloat = IPHONE_KEY_CORNER_RADIUS // check properly in init
    
    @IBInspectable var inputID: String = "no ID set"
    
    var delegate: MuFuKeyDelegate?
    
    func updateHighlightedSymbolView() {
        
        if symbolType == .Text {
            
            if let newHighlightedSymbolView = highlightedSymbolView as? UILabel {
                newHighlightedSymbolView.text = symbolText
            } else {
                if let highlightedSymbolViewFrame = highlightedSymbolView?.frame {
                    highlightedSymbolView = UILabel(frame: highlightedSymbolViewFrame)
                } else {
                    highlightedSymbolView = UILabel(frame: frame)
                }
                if highlightedSymbolView?.frame == CGRect.zero {
                    highlightedSymbolView?.frame = frame
                }
                (highlightedSymbolView as! UILabel).text = symbolText
                (highlightedSymbolView as! UILabel).backgroundColor = highlightColor
                (highlightedSymbolView as! UILabel).textColor = highlightTextColor
                (highlightedSymbolView as! UILabel).font = symbolFont
            }
            
        } else if symbolType == .Image {
            
            if let newHighlightedSymbolView = highlightedSymbolView as? UIImageView {
                newHighlightedSymbolView.image = symbolImage
            } else {
                if let highlightedSymbolViewFrame = highlightedSymbolView?.frame {
                    highlightedSymbolView = UIImageView(frame: highlightedSymbolViewFrame)
                } else {
                    highlightedSymbolView = UIImageView(frame: frame)
                }
                if highlightedSymbolView?.frame == CGRect.zero {
                    highlightedSymbolView?.frame = frame
                }
                (highlightedSymbolView as! UIImageView).image = symbolImage
                (highlightedSymbolView as! UIImageView).backgroundColor = .clear
                (highlightedSymbolView as! UIImageView).contentMode = .scaleAspectFit
            }
            
            
        }
        
    }
    
    func setupSymbolViewAsLabel() {
        
        if let label = symbolView as? UILabel {
            label.text = symbolText
        } else {
            if let symbolViewFrame = symbolView?.frame { // does it bring a frame already? then keep it
                symbolView = UILabel(frame: symbolViewFrame)
            } else {
                symbolView = UILabel(frame: frame) // otherwise use the MuFuKey's frame
            }
            if symbolView?.frame == CGRect.zero {
                symbolView?.frame = frame
            }
            (symbolView as! UILabel).text = symbolText
            (symbolView as! UILabel).font = symbolFont
        }
        updateHighlightedSymbolView()

    }
    
    func setupSymbolViewAsImage() {
        if let imageView = symbolView as? UIImageView {
            imageView.image = symbolImage
        } else {
            if let symbolViewFrame = symbolView?.frame { // does it bring a frame already? then keep it
                symbolView = UIImageView(frame: symbolViewFrame)
            } else {
                symbolView = UIImageView(frame: frame) // otherwise use the MuFuKey's frame
            }
            if symbolView?.frame == CGRect.zero {
                symbolView?.frame = frame
            }
            (symbolView as! UIImageView).image = symbolImage
            symbolView?.backgroundColor = .clear
            symbolView?.contentMode = .scaleAspectFit
        }
        updateHighlightedSymbolView()

    }
    
    func commonInit() {
        
        // corner radius
        if UIDevice.current.userInterfaceIdiom == .phone {
            cornerRadius = IPHONE_KEY_CORNER_RADIUS
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            cornerRadius = IPAD_KEY_CORNER_RADIUS
        }
        
        // wiring
        addTarget(self, action: #selector(highlight), for: .touchDown)
        addTarget(self, action: #selector(unhighlight), for: .touchUpInside)
        
        symbolText = "Title"
        setupSymbolViewAsLabel()
        
        // subview
        addSubview(symbolView!)
        addSubview(highlightedSymbolView!)
        highlightedSymbolView?.isHidden = true
    }
    
    
    func highlight() {
        symbolView?.isHidden = true
        highlightedSymbolView?.isHidden = false
    }

    func unhighlight() {
        symbolView?.isHidden = false
        highlightedSymbolView?.isHidden = true
    }

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        layer.masksToBounds = false
        clipsToBounds = true
        symbolView?.contentMode = .scaleAspectFit
        setNeedsLayout()
    }
    
    func setupAsCharacterKey() {
        
        normalColor = CHARACTER_KEY_BG_COLOR
        highlightColor = CHARACTER_KEY_HIGHLIGHT_BG_COLOR
        normalTextColor = CHARACTER_KEY_TEXT_COLOR
        highlightTextColor = CHARACTER_KEY_HIGHLIGHT_TEXT_COLOR
        
        symbolFont = CHARACTER_KEY_FONT
        
        updateHighlightedSymbolView()
    }
    
    
    func setupAsFunctionKey() {
        
        normalColor = FUNCTION_KEY_BG_COLOR
        highlightColor = FUNCTION_KEY_HIGHLIGHT_BG_COLOR
        normalTextColor = FUNCTION_KEY_TEXT_COLOR
        highlightTextColor = FUNCTION_KEY_HIGHLIGHT_TEXT_COLOR
        
        symbolFont = FUNCTION_KEY_FONT
        
        updateHighlightedSymbolView()

//        let magnifiedFrame = bounds//frame
//        magnifierView = MFBMagnifierView(frame: magnifiedFrame)
//
//        let magnifiedFrame = frame
//        magnifierView = MFBMagnifierView(rootButton: self)
//
//        magnifierView.fillColor = highlightColor
//        magnifierView.magnifiedButton.imageView?.image = imageView?.image?.tintedImage(color: .green)// titleColor(for: .normal)!)
//        magnifierView.magnifiedButton.setTitleColor(.red, for: .normal) // titleColor(for: .normal), for: .normal)
//        magnifierView.rootButton = self
//        magnification = 1.2

        
    }
    
}




//@IBDesignable class MuFuButton: UIButton {
//
//    var popoverDirection: MuFuKeyboardButtonPopoverDirection = .Inner
//    
//    lazy var magnifierView = UIView() as! MFBMagnifierView
//    @IBInspectable var magnification: CGFloat = 1.0 {
//        didSet {
//            magnifierView.magnification = magnification
//        }
//    }
//    
//    var _normalColor: UIColor = .white
//    @IBInspectable var normalColor: UIColor {
//        get {
//            return _normalColor
//        }
//        set {
//            switch customType {
//            case "Character":
//                _normalColor = CHARACTER_KEY_BG_COLOR
//            case "Function":
//                _normalColor = FUNCTION_KEY_BG_COLOR
//            default:
//                _normalColor = newValue
//            }
//            
//            checkHighlightColor()
//        }
//    }
//    
//    
//    
//    func checkHighlightColor() {
//        if isHighlighted {
//            backgroundColor = highlightColor
//        } else {
//            backgroundColor = normalColor
//        }
//        magnifierView.fillColor = highlightColor
//    }
//    
//    // Background color should be able to change with UIControlState
//    // so we store two colors as properties and change it using
//    // helper functions:
//    
//    
//    func highlight() {
//        backgroundColor = highlightColor
//        self.addSubview(magnifierView)
//        //layer.insertSublayer(magnifierView.layer, below: nil)
//        magnifierView.setNeedsDisplay()
//    }
//    
//    func unhighlight() {
//        backgroundColor = normalColor
//        //magnifierView.removeFromSuperview()
//    }
//
////    var _normalTextColor: UIColor = .black
////    @IBInspectable var normalTextColor: UIColor {
////        get {
////                return _normalTextColor
////        }
////        set {
////            switch customType {
////            case "Character":
////                _normalTextColor = CHARACTER_KEY_TEXT_COLOR
////           case "Function":
////                _normalTextColor = FUNCTION_KEY_TEXT_COLOR
////            default:
////                _normalTextColor = newValue
////            }
////        }
////    }
////
////    
//    var _highlightColor: UIColor = .blue
//    @IBInspectable var highlightColor: UIColor {
//        get {
//            return _highlightColor
//        }
//        set {
//            switch customType {
//            case "Character":
//                _highlightColor = CHARACTER_KEY_HIGHLIGHT_BG_COLOR
//            case "Function":
//                _highlightColor = FUNCTION_KEY_HIGHLIGHT_BG_COLOR
//            default:
//                _highlightColor = newValue
//            }
//            
//            checkHighlightColor()
//        }
//    }
//    
//    
//    
//    @IBInspectable var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        set {
//            layer.cornerRadius = newValue
//            layer.masksToBounds = false // newValue > 0
//        }
//    }
//    
//    // CALayer's shadow is not rendered live in Storyboard
//    // So we build our own shadow
//    
//    var buttonLayer = CAShapeLayer()
//    var shadowLayer = CAShapeLayer()
//    
//    @IBInspectable var shadowOpacity: Float = 1.0 {
//        didSet {
//            shadowLayer.opacity = shadowOpacity
//        }
//    }
//    
//    @IBInspectable var shadowColor: UIColor = .lightGray {
//        didSet {
//            shadowLayer.fillColor = shadowColor.cgColor
//        }
//    }
//    
//    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 1) {
//        didSet {
//            shadowLayer.frame = frame
//            shadowLayer.frame.origin.x += shadowOffset.width
//            shadowLayer.frame.origin.y += shadowOffset.height
//        }
//    }
//    
////    @IBInspectable var customImage: UIImage? {
////        didSet {
////            imageView?.image = customImage
////            highlightedImage = customImage?.tintedImage(color: highlightTextColor)
////        }
////    }
////
////    var highlightedImage: UIImage?
//    
//    // Button Type: "Character" is the white kind
//    // "Function" are they gray buttons such as Shift, return etc.
//    
//    // They override the IBInspectable properties, so setting them has no effect
//    // as long as the button type is either Character or Function.
//    
//    // Set it to Custom or anything else to customize the button with
//    // the IBDesignable properties.
//    
//    @IBInspectable var customType: String = "" {
//        didSet {
//            switch customType {
//            case "Character":
//                setupAsCharacterButton()
//            case "Function":
//                NSLog("customType set to 'Function'")
//                setupAsFunctionButton()
//            case "Custom":
//                break
//            default:
//                break
//            }
//            
//        }
//    }
//    
//    func setupAsCharacterButton() {
//        NSLog("setupAsCharacterButton")
//        normalColor = CHARACTER_KEY_BG_COLOR
////        normalTextColor = CHARACTER_KEY_TEXT_COLOR
//        highlightColor = CHARACTER_KEY_HIGHLIGHT_BG_COLOR
////        highlightTextColor = CHARACTER_KEY_HIGHLIGHT_TEXT_COLOR
//        setTitleColor(CHARACTER_KEY_TEXT_COLOR, for: .normal)
//        setTitleColor(CHARACTER_KEY_HIGHLIGHT_TEXT_COLOR, for: .highlighted)
//        
//        
//        backgroundColor = normalColor
//        
//        shadowColor = BUTTON_SHADOW_COLOR
//        shadowOffset = CGSize(width: 0, height: 1)
//        
//        cornerRadius = 4.0
//        
//        // character buttons use font size 22
//        titleLabel?.font = .systemFont(ofSize: 22)
//        
//        imageView?.contentMode = .scaleAspectFit
//        
//        setupMagnifiedView()
//        
//    }
//    
//    func setupAsFunctionButton() {
//        NSLog("setupAsFunctionButton")
//
//        normalColor = FUNCTION_KEY_BG_COLOR
////        normalTextColor = FUNCTION_KEY_TEXT_COLOR
//        highlightColor = FUNCTION_KEY_HIGHLIGHT_BG_COLOR
//        //        highlightTextColor = FUNCTION_KEY_HIGHLIGHT_TEXT_COLOR
//        //        highlightTextColor = CHARACTER_KEY_HIGHLIGHT_TEXT_COLOR
//        setTitleColor(FUNCTION_KEY_TEXT_COLOR, for: .normal)
//        setTitleColor(FUNCTION_KEY_HIGHLIGHT_TEXT_COLOR, for: .highlighted)
//        
//        backgroundColor = normalColor
//        
//        shadowColor = BUTTON_SHADOW_COLOR
//        shadowOffset = CGSize(width: 0, height: 1)
//        
//        cornerRadius = 4.0
//        
//        // function buttons may use another font size
//        
//        magnification = 1.5
//        
//        setupMagnifiedView()
//        
//    }
//    
//    // actions common to all initializers
//    func commonInit() {
//        NSLog("commonInit")
//        addTarget(self, action: #selector(highlight), for: .touchDown)
//        addTarget(self, action: #selector(unhighlight), for: .touchUpInside)
//        // Text color can be associated with control state using
//        // a built-in function:
//        //setTitleColor(normalTextColor, for: .normal)
//        //setTitleColor(highlightTextColor, for: .highlighted)
//        // Background color is first set to normalColor (not highlighted)
//        backgroundColor = normalColor
//        imageView?.sizeToFit()
//        setupMagnifiedView()
//        
//    }
//    
//    func setupMagnifiedView() {
//        
//        let magnifiedFrame = bounds//frame
//        magnifierView = MFBMagnifierView(frame: magnifiedFrame)
//        magnifierView.fillColor = highlightColor
//        magnifierView.magnifiedButton.imageView?.image = imageView?.image?.tintedImage(color: .green)// titleColor(for: .normal)!)
//        magnifierView.magnifiedButton.setTitleColor(.red, for: .normal) // titleColor(for: .normal), for: .normal)
//        magnifierView.rootButton = self
//        magnification = 1.2
//        
//        
//        // position
//        magnifierView.frame = magnifierView.frame.applying(CGAffineTransform(translationX: self.bounds.midX - magnifierView.frame.midX, y: self.bounds.maxY - magnifierView.frame.maxY + magnifierView.padding))
//        
//        layer.insertSublayer(magnifierView.layer, below: imageView?.layer)
//        
//        
//    }
//    
//    override init(frame: CGRect) {
//        NSLog("init(frame:)")
//        super.init(frame: frame)
//        commonInit()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        NSLog("init(coder:)")
//        super.init(coder: aDecoder)
//        commonInit()
//    }
//    
//    
//    override func prepareForInterfaceBuilder() {
//        NSLog("prepareForInterfaceBuilder")
//        layer.masksToBounds = false
//        clipsToBounds = true
//        imageView?.contentMode = .scaleAspectFit
//        setNeedsLayout()
//    }
//    
//    
//    
//    
//    
//    override func draw(_ rect: CGRect) {
//        
//        // fit image (if there is one)
//        if imageView?.image != nil {
//            imageView?.contentMode = .scaleAspectFit
//        }
//        
//        if image(for: .highlighted) == image(for: .normal) {
//            // save highlighted version of image
//            if let highlightTextColor = titleColor(for: .highlighted) {
//                let highlightedImage = imageView?.image?.tintedImage(color: highlightTextColor)
//        
//        
//            // and associate with control states
//            //setImage(customImage, for: .normal)
//                setImage(highlightedImage, for: .highlighted)
//            //setTitle("test", for: .highlighted)
//            }
//        }
//        
//        NSLog("draw")
//        // update colors (for live storyboard rendering)
////        if isHighlighted {
////            backgroundColor = highlightColor
////            titleLabel?.textColor = highlightTextColor
////            tintColor = highlightTextColor
////            
////        } else {
////            backgroundColor = normalColor
////            titleLabel?.textColor = normalTextColor
////            tintColor = normalTextColor
////        }
//        
//        
//        // draw shadow: first recreate the button shape
//        let context = UIGraphicsGetCurrentContext()
//        
//        let roundedRectanglePath = UIBezierPath(roundedRect: CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height), cornerRadius: cornerRadius)
//        context?.saveGState()
//        context?.setShadow(offset: shadowOffset, blur: 0, color: shadowColor.cgColor)
//        backgroundColor?.setFill()
//        roundedRectanglePath.fill()
//        context?.restoreGState()
//        
//        buttonLayer = CAShapeLayer()
//        buttonLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
//        buttonLayer.fillColor = backgroundColor?.cgColor
//        buttonLayer.frame = layer.frame
//        
//        
//        // now draw this shape in the shadow layer
//        shadowLayer = CAShapeLayer()
//        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
//        shadowLayer.fillColor = shadowColor.cgColor
//        shadowLayer.opacity = shadowOpacity
//        superview?.layer.insertSublayer(buttonLayer, below: layer)
//        
//        // and position
//        shadowLayer.frame = layer.frame
//        shadowLayer.frame.origin.x += shadowOffset.width
//        shadowLayer.frame.origin.y += shadowOffset.height
//        superview?.layer.insertSublayer(shadowLayer, below: buttonLayer)
//
//        layer.masksToBounds = false
//        clipsToBounds = true
//        
//
//    }
//    
//
//
//    
//}
