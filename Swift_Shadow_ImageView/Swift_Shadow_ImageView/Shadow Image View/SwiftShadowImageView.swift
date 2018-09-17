//
//  SwiftShadowImageView.swift
//  Swift_Shadow_ImageView
//
//  Created by George Leonidas on 17/09/2018.
//  Copyright © 2018 George Leonidas. All rights reserved.
//

import UIKit

@IBDesignable class SwiftShadowImageView: UIView {
    
    @IBInspectable fileprivate var borderColor: UIColor = .black { didSet { self.layer.borderColor = self.borderColor.cgColor } }
    @IBInspectable fileprivate var borderWidth: CGFloat = 0.00 { didSet { self.layer.borderWidth = self.borderWidth } }
    @IBInspectable fileprivate var cornerRadius: CGFloat = 0.00 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
            layoutImage()
        }
    }
    
    // ImageView Attributes
    @IBInspectable fileprivate var image: UIImage? { didSet { self.imageView.image = self.image } }
    @IBInspectable fileprivate var imageContentMode: UIViewContentMode = .scaleAspectFill { didSet { layoutImage() } }
    
    // Shadow Attributes
    @IBInspectable fileprivate var imageShadowColor: UIColor = .black { didSet { dropShadow() } }
    @IBInspectable fileprivate var imageShadowOpacity: Float = 0.0 { didSet { dropShadow() } }
    @IBInspectable fileprivate var imageShadowRadius: CGFloat = 0.0 { didSet { dropShadow() } }
    @IBInspectable fileprivate var imageShadowOffset: CGSize = .zero { didSet { dropShadow() } }
    
    var imageView = UIImageView()
    
    init(x: CGFloat = 0.0, y: CGFloat = 0.0, width: CGFloat, height: CGFloat,
        cornerRadius: CGFloat = 0.0,
        borderWidth: CGFloat = 0.0,
        borderColor: UIColor = .black,
        image: UIImage,
        imageContentMode: UIViewContentMode = .scaleAspectFill,
        imageShadowColor: UIColor = .black,
        imageShadowOpacity: Float = 0.0,
        imageShadowRadius: CGFloat = 0.0,
        imageShadowOffset: CGSize = .zero)
    {
        
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.image = image
        self.imageContentMode = imageContentMode
        self.imageShadowColor = imageShadowColor
        self.imageShadowOpacity = imageShadowOpacity
        self.imageShadowRadius = imageShadowRadius
        self.imageShadowOffset = imageShadowOffset
        
        super.init(frame: CGRect(x: x, y: y, width: width, height: height))
        
        setupView()
    }
    
    override func layoutSubviews() {
        layoutImage()
        dropShadow()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    fileprivate func setupView() {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    fileprivate func layoutImage() {
        imageView.frame = CGRect(x: 0.0, y: 0.0, width: self.bounds.width, height: self.bounds.height)
        self.addSubview(imageView)
        imageView.contentMode = self.contentMode
        imageView.layer.cornerRadius = self.layer.cornerRadius
        imageView.layer.masksToBounds = true
    }
    
    fileprivate func dropShadow() {
        self.layer.shadowColor = imageShadowColor.cgColor
        self.layer.shadowOpacity = imageShadowOpacity
        self.layer.shadowOffset = imageShadowOffset
        self.layer.shadowRadius = imageShadowRadius
        self.layer.shadowPath = UIBezierPath(roundedRect: self.layer.bounds, cornerRadius: cornerRadius).cgPath
    }
}
