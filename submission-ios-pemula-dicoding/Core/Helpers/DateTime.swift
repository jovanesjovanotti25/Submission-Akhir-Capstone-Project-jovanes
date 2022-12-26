//
//  DateTime.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 06/10/22.
//

import UIKit

class DateTime: NSObject {
    class func dateFormatter(date: String) -> String {
            
        let eventDate = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateNew = dateFormatter.date(from:eventDate)
        return dateNew?.toString(dateFormat: "dd MMMM yyyy") ?? ""
    }
}


extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en")
        return dateFormatter.string(from: self)
    }
}
