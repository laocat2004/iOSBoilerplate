//
//  NotificationCenterUtil.swift
//  Pods
//
//  Created by Levi Bostian on 12/29/16.
//
//

import Foundation

class NotificationCenterUtil {
    
    fileprivate static let userLoggedInNotification = "userLoggedInNotification"
    fileprivate static let userUnauthorizedNotification = "userUnauthorizedNotification"
    
    class func postUserLoggedInNotification() {
        postNotification(userLoggedInNotification)
    }
    
    class func observeUserLoggedInNotification(_ observer: AnyObject, selector: Selector) {
        observeNotification(observer, selector: selector, name: userLoggedInNotification)
    }
    
    class func postUserUnauthorized(_ shouldShowLoggedOutMessage: Bool, errorMessage: String? = nil) {
        postNotification(userUnauthorizedNotification, userInfo: ["shouldShowLoggedOutMessage": shouldShowLoggedOutMessage, "errorMessage": errorMessage])
    }
    
    class func observeUserUnauthorized(_ observer: AnyObject, selector: Selector) {
        observeNotification(observer, selector: selector, name: userUnauthorizedNotification)
    }
    
    class func removeObserver(_ observer: AnyObject) {
        NotificationCenter.default.removeObserver(observer)
    }
    
    fileprivate class func postNotification(_ name: String, userInfo: Dictionary<String, Any?>? = nil) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: nil, userInfo: userInfo)
    }
    
    fileprivate class func postNotification(_ name: String) {
        postNotification(name)
    }
    
    fileprivate class func observeNotification(_ observer: AnyObject, selector: Selector, name: String) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(rawValue: name), object: nil)
    }
    
}