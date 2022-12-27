//
//  Helper.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 05/10/22.
//

import UIKit

class Helper {
    
    class func getBasicInfo() -> [String: Any] {
          
        var osName: String
        var osVersion: String
        var deviceClassName: String
        var deviceFamilyName: String
        var appVersion: String
        var deviceId: String
        
        osVersion = UIDevice.current.systemVersion
        deviceClassName = UIDevice.current.model
        
        if (UIDevice.current.userInterfaceIdiom == .pad){
            deviceClassName = "iPad"
        }
        else{
            deviceClassName = "iPhone"
        }
        
        deviceFamilyName = UIDevice.current.name
        deviceId = UIDevice.current.identifierForVendor?.uuidString ?? ""
        osName = UIDevice.current.systemName
        appVersion = getAppCurrentVersionNumber()
        
        let basicInfo: [String: Any] = [
            "os_name": osName,
            "os_version": osVersion,
            "device_class":deviceClassName,
            "device_family":deviceFamilyName,
            "app_version":appVersion,
            "device_id": deviceId
        ]
        return basicInfo
    }
    
    class func getAppCurrentVersionNumber() -> String {
        let nsObject: AnyObject? = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as AnyObject?
        return nsObject as! String
    }
}

extension Helper {
    class func basicInfo() -> String? {
        let basicInfo = getBasicInfo()
        do {
            let jsonData = try! JSONSerialization.data(withJSONObject: basicInfo, options: [])
            if let string = String(data: jsonData, encoding: String.Encoding.utf8) {
                return string
            }
        }
        return ""
    }
}
