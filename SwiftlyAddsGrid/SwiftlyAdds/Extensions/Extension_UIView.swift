//
//  Extension_UIView.swift
//  SwiftlyAdds
//
//  Created by MARIJAN VUKCEVICH on 5/28/21.
//

import Foundation
import UIKit

extension UIView {
    
    func addDropShadow(shadow_color: UIColor,offset: CGSize,shadow_radius: CGFloat,shadow_opacity: Float,corner_radius: CGFloat, shadow_path:UIBezierPath) {
        self.layer.shadowColor = shadow_color.cgColor
        self.layer.shadowOpacity = shadow_opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = shadow_radius
        self.layer.cornerRadius = corner_radius
        self.layer.shadowPath = shadow_path.cgPath
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.white.cgColor
    }
    
}
