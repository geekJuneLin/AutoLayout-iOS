//
//  PageCell.swift
//  animation
//
//  Created by Junyu Lin on 24/07/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class PageCell : UICollectionViewCell{
    
    var page: Page? {
        didSet{
            // make sure the page is not nil otherwise it will crash when it's nil, combinding opitional
            guard let unwrappedPage = page else{ return }
            
            // assign the image, headerText and bodyText
            iconImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes:
                        [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
                    attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor:UIColor.gray]))
            
            descriptionTextview.attributedText = attributedText
            descriptionTextview.textAlignment = .center
            
        }
    }
    
    // create the iconImageView
    private let iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "icon"))
        //this enables autolayout for the imageview
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // create the descriptionTextView
    private let descriptionTextview: UITextView = {
        let textView = UITextView()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    

    
    // method for setting up layout
    private func setUpLayout(){
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        topImageContainerView.addSubview(iconImageView)
        
        iconImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5).isActive = true
        iconImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descriptionTextview)
        descriptionTextview.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextview.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextview.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    // call the super init method
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
