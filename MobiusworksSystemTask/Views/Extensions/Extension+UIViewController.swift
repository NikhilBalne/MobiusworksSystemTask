//
//  Extension+UIViewController.swift
//  MobiusworksSystemTask
//
//  Created by Nikhil Balne on 21/12/20.
//

import Foundation
import UIKit

extension UIViewController {
    
    // MARK: - showActivityIndicator
    func showActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        activityIndicator.layer.cornerRadius = 6
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.startAnimating()
        activityIndicator.tag = 100

        // before adding it, you need to check if it is already has been added:
        for subview in view.subviews {
            if subview.tag == 100 {
                return
            }
        }
        view.addSubview(activityIndicator)
    }

    // MARK: - showActivityIndicator
    func hideActivityIndicator() {
        let activityIndicator = view.viewWithTag(100) as? UIActivityIndicatorView
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
    }
}

