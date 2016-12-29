//
//  PermissionUtil.swift
//  Pods
//
//  Created by Levi Bostian on 12/29/16.
//
//

import Foundation
import UIKit

class PermissionUtil {
    
    static func areAppNotificationsEnabled() -> Bool {
        let notificationType = UIApplication.shared.currentUserNotificationSettings!.types
        
        return notificationType != UIUserNotificationType()
    }
    
}
