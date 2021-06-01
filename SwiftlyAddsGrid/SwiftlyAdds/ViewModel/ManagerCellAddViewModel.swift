//
//  ManagerCellAddViewModel.swift
//  SwiftlyAdds
//
//  Created by MARIJAN VUKCEVICH on 5/30/21.
//

import Foundation

import Foundation
import UIKit

class ManagerCellAddViewModel {
    
    var imageStr: String
    let origPrice: String
    let price: String
    let display: String
    
    var boxViewWidth: CGFloat = 0
    var boxViewHeight: CGFloat = 0

    init(managerSpecial: ManagerSpecial?, canvasUnit: Int?) {
       
        let boundsWidth = UIScreen.main.bounds.width
        let baseUnit = boundsWidth / CGFloat(canvasUnit ?? 0)
        
        boxViewWidth = baseUnit * CGFloat(managerSpecial?.width ?? 0) - 20
        boxViewHeight = baseUnit * CGFloat(managerSpecial?.height ?? 0)
        
        var imaageLetter = "L"
        if managerSpecial != nil && managerSpecial?.imageURL != nil {
            if managerSpecial!.imageURL!.contains("J") {
                imaageLetter = "J"
            } else if managerSpecial!.imageURL!.contains("K") {
                imaageLetter = "K"
            }
        }
        imageStr = imaageLetter
        
        let dollarOrigPrice = Utils.currencyFormatter(value: managerSpecial?.originalPrice, numberOfFractions: 2)
        origPrice =  dollarOrigPrice
        let dollarPrice = Utils.currencyFormatter(value: managerSpecial?.price, numberOfFractions: 2)
        price = dollarPrice
        display = managerSpecial?.displayName ?? ""
    }
    
}
