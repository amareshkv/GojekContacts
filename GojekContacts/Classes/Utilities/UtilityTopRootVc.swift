//
//  UtilityTopRootVc.swift
//  ResidentialLock
//
//  Created by Amaresh K V on 17/10/17.
//

import UIKit

class UtilityTopRootVc: NSObject {

    @objc class func getTopRootViewController() -> UIViewController? {
        if var topRootViewController = UIApplication.shared.windows.first?.rootViewController {
            while topRootViewController.presentedViewController != nil {
                if let presentedViewController = topRootViewController.presentedViewController {
                    topRootViewController = presentedViewController
                }
            }
            return topRootViewController
        }
        return nil
    }

}
