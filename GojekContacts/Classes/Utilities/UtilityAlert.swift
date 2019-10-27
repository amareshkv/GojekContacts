//
//  UtilityAlert.swift
//  ResidentialLock
//
//  Created by Amaresh K V on 17/10/17.
//

import UIKit

class UtilityAlert: NSObject {

    @objc class func showAlert(withTitle title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { (_) in
            DispatchQueue.main.async {
                alert.dismiss(animated: true, completion: nil)
            }
        }
        alert.addAction(ok)
        DispatchQueue.main.async {
            if let topRootViewController = UtilityTopRootVc.getTopRootViewController() {
                topRootViewController.present(alert, animated: true, completion: nil)
            }
        }
    }

    @objc class func showAlert(withTitle title: String?, message: String?, completion : (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { (_) in
            DispatchQueue.main.async {
                alert.dismiss(animated: true, completion: nil)
                if let completion = completion {
                    completion()
                }
            }
        }

        alert.addAction(ok)
        DispatchQueue.main.async {
            if let topRootViewController = UtilityTopRootVc.getTopRootViewController() {
                topRootViewController.present(alert, animated: true, completion: nil)
            }
        }
    }

    @objc class func showAlert(withTitle title: String?, andActions alertActionsArray: NSArray?) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        if let alertActionsArray = alertActionsArray {
            for object in alertActionsArray {
                if let object = object as? UIAlertAction {
                    alert.addAction(object)
                }
            }
        }
        DispatchQueue.main.async {
            if let topRootViewController = UtilityTopRootVc.getTopRootViewController() {
                topRootViewController.present(alert, animated: true, completion: nil)
            }
        }
    }

    @objc class func showAlert(withTitle title: String?, andMessage message: String?, andActions alertActionsArray: NSArray?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let alertActionsArray = alertActionsArray {
            for object in alertActionsArray {
                if let object = object as? UIAlertAction {
                    alert.addAction(object)
                }
            }
        }
        DispatchQueue.main.async {
            if let topRootViewController = UtilityTopRootVc.getTopRootViewController() {
                topRootViewController.present(alert, animated: true, completion: nil)
            }
        }
    }
}
