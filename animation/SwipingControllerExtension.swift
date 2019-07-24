//
//  SwipingControllerExtension.swift
//  animation
//
//  Created by Junyu Lin on 24/07/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

extension SwipingController{
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControll.currentPage == 0{
                
                self.collectionView?.contentOffset = .zero
                
            } else {
                let indexPath = IndexPath(item: self.pageControll.currentPage, section: 0)
                
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }) { (_) in
            
        }
    }
    
}
