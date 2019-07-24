//
//  ViewController.swift
//  animation
//
//  Created by Junyu Lin on 24/07/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

extension UIColor{
    static var pink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {
    
    // avoid polluting viewDidload
    // {} is referred as closure
    let iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "icon"))
        //this enables autolayout for the imageview
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextview: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes:
            [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor:UIColor.gray]))
        
        textView.attributedText = attributedText

        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    // make sure apply the correct encapsulation principles
    private let previouseBtn: UIButton = {
        let uiBtn = UIButton(type: .system)
        uiBtn.setTitle("PREV", for: .normal)
        uiBtn.setTitleColor(.gray, for: .normal)
        uiBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        uiBtn.translatesAutoresizingMaskIntoConstraints = false
        return uiBtn
    }()
    
    private let nextBtn: UIButton = {
        let uiBtn = UIButton(type: .system)
        uiBtn.setTitle("NEXT", for: .normal)
//        uiBtn.setTitleColor(.gray, for: .normal)
        uiBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        uiBtn.setTitleColor(.pink, for: .normal)
        uiBtn.translatesAutoresizingMaskIntoConstraints = false
        return uiBtn
    }()
    
    private let pageControll: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .pink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //view.addSubview(iconImageView)
        view.addSubview(descriptionTextview)
        
        setUpButtonControls()
        
        setUpLayout()
        
    }
    
    fileprivate func setUpButtonControls(){
        
        let bottomControllsStackView = UIStackView(arrangedSubviews: [previouseBtn, pageControll, nextBtn])
        bottomControllsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControllsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControllsStackView)
        
        NSLayoutConstraint.activate([
            bottomControllsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControllsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControllsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControllsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    private func setUpLayout(){
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        topImageContainerView.addSubview(iconImageView)
        
        iconImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5).isActive = true
        iconImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        descriptionTextview.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

