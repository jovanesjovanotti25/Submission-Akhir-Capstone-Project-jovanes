//
//  BaseService.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 05/10/22.
//

import UIKit

public class BaseService: NSObject {
    lazy public var HOST_URL: String = {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            let dictionary = NSDictionary(contentsOfFile: path)
            return dictionary!["HOST_URL"] as! String
        } else {
            return ""
        }
    }()
    
    lazy public var apiKey: String = {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            let dictionary = NSDictionary(contentsOfFile: path)
            return dictionary!["apiKey"] as! String
        } else {
            return ""
        }
    }()
    
    public func showResponseData(data: Data?) {
        if data != nil {
            let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
            Logger.printLog(json)
            
            if json == nil {
                let string = String(data: data!, encoding: .utf8)
                Logger.printLog("Failed Show Response Data")
                Logger.printLog(string)
            }
        }
    }
}
