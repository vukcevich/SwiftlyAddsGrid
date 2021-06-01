//
//  Utils.swift
//  SwiftlyAdds
//
//  Created by MARIJAN VUKCEVICH on 5/30/21.
//

import Foundation

struct Utils {
    
    public static func currencyFormatter<T>(value: T, numberOfFractions: Int) -> String {
         let currencyFormatter = NumberFormatter()
         currencyFormatter.usesGroupingSeparator = true
         currencyFormatter.numberStyle = .currency
         currencyFormatter.locale = Locale(identifier: "en_US")
         currencyFormatter.minimumFractionDigits = numberOfFractions
       
         var priceString = ""

         if let typedValue = value as? NSNumber {
            priceString = currencyFormatter.string(from: typedValue)!
         } else  {
             priceString = currencyFormatter.string(from: NSNumber(value: (value as! NSString).doubleValue) )!
         }
         
         return priceString
     }
    
}
