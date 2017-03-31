//
//  NibCustomView.swift
//  DemoIBDesignableFromNib
//
//  Created by Luis Wu on 3/31/17.
//  Copyright © 2017 Luis Wu. All rights reserved.
//

import UIKit

protocol NibDesignable {
    var className: String { get }
}

//extension NibDesignable {
//    func fromNib<T: NibCustomView>() -> T {
////        return Bundle(for: T.self).loadNibNamed("\(type(of: self))", owner: nil, options: nil)![0] as! T
//    }
//    
//}

@IBDesignable
public class NibCustomView: UIView/*, NibDesignable*/ {
    
    @IBOutlet public weak var label: UILabel!
    
    @IBInspectable var title: String = "" {
        didSet {
            label.text = title
        }
    }
    
//    internal var className: String {
//        return "\(type(of: self))"
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        debugPrint("\(self.className)")
        let proxyView = loadNib()
        self.addSubview(proxyView)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[proxyView]|", options: .alignAllTop, metrics: nil, views: ["proxyView": proxyView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[proxyView]|", options: .alignAllLeft, metrics: nil, views: ["proxyView": proxyView]))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        debugPrint("\(#function)")
        super.init(coder: aDecoder)
        let proxyView = loadNib()
        self.addSubview(proxyView)
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[proxyView]|", options: .alignAllTop, metrics: nil, views: ["proxyView": proxyView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[proxyView]|", options: .alignAllLeft, metrics: nil, views: ["proxyView": proxyView]))
    }
    
    private func loadNib() -> UIView {
        let bundle = Bundle(for: type(of:self))
        let nib = UINib(nibName: "\(type(of: self))", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
//        self.label = view.subviews.first as! UILabel
        return view
    }
    
//    override func prepareForInterfaceBuilder() {
//    }

}
