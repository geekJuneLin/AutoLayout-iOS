//
//  SwipingController.swift
//  animation
//
//  Created by Junyu Lin on 24/07/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    // create the data array
    let pages = [
        Page(imageName: "icon", headerText: "Join us today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "dinosaur", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "icon", headerText: "Join us today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "dinosaur", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "icon", headerText: "Join us today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "dinosaur", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have.")
    ]
    
    // make sure apply the correct encapsulation principles
    private let previouseBtn: UIButton = {
        let uiBtn = UIButton(type: .system)
        uiBtn.setTitle("PREV", for: .normal)
        uiBtn.setTitleColor(.gray, for: .normal)
        uiBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        uiBtn.translatesAutoresizingMaskIntoConstraints = false
        uiBtn.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return uiBtn
    }()
    
    private let nextBtn: UIButton = {
        let uiBtn = UIButton(type: .system)
        uiBtn.setTitle("NEXT", for: .normal)
        uiBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        uiBtn.setTitleColor(.pink, for: .normal)
        uiBtn.translatesAutoresizingMaskIntoConstraints = false
        uiBtn.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return uiBtn
    }()
    
    lazy var pageControll: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .pink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    @objc private func handlePrev(){
        print("Trying to get back")
        
        let nextIndex = max(pageControll.currentPage - 1, 0)
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        
        pageControll.currentPage = nextIndex
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handleNext(){
        print("Trying to advance to next")
        
        let nextIndex = min(pageControll.currentPage + 1, pages.count - 1 )
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        
        pageControll.currentPage = nextIndex
        
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
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
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControll.currentPage = Int(x / view.frame.width)
    }

    // view did load method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtonControls()
        
        collectionView?.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
    }
    
    // collection view delegate methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell

        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    // set each cell to be the same size of the view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
