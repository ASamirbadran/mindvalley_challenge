//
//  Loader.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/6/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import UIKit

class Loader: NSObject {
    
    static var sharedViewSpinner: UIView?
    
    class func show (onView: UIView) {
        
        let spinnerView = UIView(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.clear
        let viewBackgroundLoading: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.color = UIColor.white
        activityIndicator.startAnimating()
        activityIndicator.center = viewBackgroundLoading.center
        viewBackgroundLoading.addSubview(activityIndicator)
        
        viewBackgroundLoading.center = spinnerView.center
        viewBackgroundLoading.backgroundColor = UIColor.darkGray
        viewBackgroundLoading.alpha = 0.5
        viewBackgroundLoading.clipsToBounds = true
        viewBackgroundLoading.layer.cornerRadius = 15
        
        spinnerView.addSubview(viewBackgroundLoading)
        onView.addSubview(spinnerView)
        
        sharedViewSpinner = spinnerView
    }
    
    class func hide() {
        DispatchQueue.main.async { // Make sure you're on the main thread here
            sharedViewSpinner?.removeFromSuperview()
            sharedViewSpinner = nil
            
        }
    }
}
