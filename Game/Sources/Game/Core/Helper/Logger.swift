//
//  Logger.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 05/10/22.
//

import UIKit

public class Logger: NSObject {
    let enableLoging = true
    public class func printLog(_ items: Any?) {
        print(items ?? "=== printLog empty")
    }
}
