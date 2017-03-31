//
//  CustomView.swift
//  DemoIBDesignableFromNib
//
//  Created by Luis Wu on 3/31/17.
//  Copyright © 2017 Luis Wu. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    private weak var imageView: UIImageView!
    private weak var label: UILabel!
    
    private var imageContentMode: UIViewContentMode = .scaleToFill
    
    @IBInspectable var image: UIImage? = nil {
        didSet {
            debugPrint("\(#function)")
            imageView.image = image
        }
    }
    @IBInspectable var title: String? = nil {
        didSet {
            debugPrint("\(#function)")
            label.text = title
        }
    }
    
    @IBInspectable var contentModeAdapter: Int {
        get {
            debugPrint("\(#function)")
            return imageContentMode.rawValue
        }
        
        set {
            debugPrint("\(#function)")
            imageContentMode = UIViewContentMode(rawValue: newValue) ?? .scaleToFill
            imageView.contentMode = imageContentMode
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            debugPrint("\(#function)")
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var titleColor: UIColor = .white {
        didSet {
            debugPrint("\(#function)")
            self.label.textColor = titleColor
        }
    }
    
    override init(frame: CGRect) {
        // Interface builder live rendering calls from here
        debugPrint("\(#function)")
        
        let imageViewRef = UIImageView()
        let labelRef = UILabel()
        self.imageView = imageViewRef
        self.label = labelRef
        super.init(frame: frame)
        addSubview(self.imageView)
        addSubview(self.label)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // App instantiate custom views from here
        
        debugPrint("\(#function)")
        let imageViewRef = UIImageView()
        let labelRef = UILabel()
        self.imageView = imageViewRef
        self.label = labelRef
        super.init(coder: aDecoder)
        addSubview(self.imageView)
        addSubview(self.label)
        
        setupUI()
    }
    
    override func awakeFromNib() {
        debugPrint("\(#function)")
        super.awakeFromNib()
    }
    
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        debugPrint("\(#function)")
        return super.awakeAfter(using: aDecoder)
    }
    
    // Avoid use / override this unless you really need to draw by your own
    // the performance, even with empty implementation, would be really bad!
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//    }
    
    override func layoutMarginsDidChange() {
        debugPrint("\(#function)")
        super.layoutMarginsDidChange()
    }
    
    override func layoutSubviews() {
        debugPrint("\(#function)")
        super.layoutSubviews()  // after this, the subviews' frames are determined!!! yeah!
        debugPrint("imageView: \(imageView.frame), label: \(label.frame)")
        imageView.layer.cornerRadius = imageView.bounds.size.width / 2
    }
    
    override func prepareForInterfaceBuilder() {
        debugPrint("\(#function)")
        super.prepareForInterfaceBuilder()
//        setupUI()
    }
    
    override func layoutIfNeeded() {
        debugPrint("\(#function)")
        super.layoutIfNeeded()
    }
    
    override func didMoveToSuperview() {
        debugPrint("\(#function)")
        super.didMoveToSuperview()
    }
    
    override func didAddSubview(_ subview: UIView) {
        debugPrint("\(#function)")
        super.didAddSubview(subview)
    }
    
    // MARK - private
    private func setupUI() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 1, constant: 0))
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(16)-[imageView]-(10)-[label]-(10)-|", options: [.alignAllTop], metrics: nil, views: ["imageView": imageView, "label": label]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(10)-[imageView]-(10)-|", options: [.alignAllLeft], metrics: nil, views: ["imageView": imageView]))
        self.addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .lessThanOrEqual, toItem: self, attribute: .width, multiplier: 0.3, constant: 0))
        
    }
    
}
