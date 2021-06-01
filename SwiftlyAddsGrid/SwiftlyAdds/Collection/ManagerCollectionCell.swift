//
//  ManagerCollectionCell.swift
//  SwiftlyAdds
//
//  Created by MARIJAN VUKCEVICH on 5/28/21.
//

import UIKit

class ManagerCollectionCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = String(describing: self)
    
    var managerAddViewModel: ManagerCellAddViewModel? {
        didSet {
            
            let addImage = UIImage(named: managerAddViewModel?.imageStr ?? "L")
            imgView.image = addImage
            
            origPrice.text = managerAddViewModel?.origPrice ?? ""
            let attributedTopText = NSMutableAttributedString(string: managerAddViewModel?.origPrice ?? "")
            let firstAttributes: [NSAttributedString.Key: Any] = [ .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                                                        .strikethroughColor: UIColor.lightGray
            ]
            attributedTopText.setAttributes(firstAttributes, range: NSMakeRange(0,origPrice.text!.count))
            
            origPrice.attributedText = attributedTopText
               
            price.text = managerAddViewModel?.price
            display.text = managerAddViewModel?.display
            
            boxViewWidth.constant = managerAddViewModel?.boxViewWidth ?? 0
           
            boxView.setNeedsLayout()
            boxView.setNeedsDisplay()
            
            contentView.setNeedsLayout()
        }
    }
    
    var canvasUnit = 0
    
    var boxView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.white
        return v
    }()
   var boxViewWidth: NSLayoutConstraint!
    var boxViewHeight: NSLayoutConstraint!
    
    var imgView : UIImageView = {
        let ig = UIImageView()
        return ig
    }()
    var origPrice : UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: "Helvetica", size: 14)
        lb.textColor = UIColor.lightGray
        lb.textAlignment = .right
        lb.sizeToFit()
        return lb
    }()
    var price : UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: "Helvetica", size: 14)
        lb.textColor = UIColor.green
        lb.textAlignment = .right
        lb.sizeToFit()
        return lb
    }()
    var display : UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: "Helvetica", size: 14)
        lb.textColor = UIColor.black
        lb.numberOfLines = 2
        lb.textAlignment = .center
        lb.sizeToFit()
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        contentView.addSubview(boxView)
        boxView.addSubview(imgView)
        boxView.addSubview(origPrice)
        boxView.addSubview(price)
        boxView.addSubview(display)
        
        constraintsForUI()
    }
    
    
    func constraintsForUI() {
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.topAnchor.constraint(equalTo: boxView.topAnchor, constant: 20).isActive = true
        imgView.leadingAnchor.constraint(equalTo: boxView.leadingAnchor, constant: 20).isActive = true
        imgView.widthAnchor.constraint(lessThanOrEqualToConstant: 72).isActive = true
        imgView.heightAnchor.constraint(lessThanOrEqualToConstant: 72).isActive = true
        imgView.bottomAnchor.constraint(equalTo: display.topAnchor, constant: -10).isActive = true
        
        origPrice.translatesAutoresizingMaskIntoConstraints = false
        origPrice.topAnchor.constraint(equalTo:imgView.topAnchor, constant: 0).isActive = true
        origPrice.trailingAnchor.constraint(equalTo: boxView.trailingAnchor, constant: -10).isActive = true
        origPrice.widthAnchor.constraint(equalToConstant: 85).isActive = true
        origPrice.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        price.translatesAutoresizingMaskIntoConstraints = false
        price.topAnchor.constraint(equalTo: origPrice.bottomAnchor, constant: 0).isActive = true
        price.trailingAnchor.constraint(equalTo: boxView.trailingAnchor, constant: -10).isActive = true
        price.widthAnchor.constraint(equalToConstant: 85).isActive = true
        price.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        display.translatesAutoresizingMaskIntoConstraints = false
        display.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 10).isActive = true
        display.widthAnchor.constraint(equalTo: boxView.widthAnchor, multiplier: 0.80).isActive = true
        display.centerXAnchor.constraint(equalTo: boxView.centerXAnchor, constant: 0).isActive = true
        display.bottomAnchor.constraint(equalTo: boxView.bottomAnchor, constant: -5).isActive = true
        
        boxView.translatesAutoresizingMaskIntoConstraints = false
        boxView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        boxViewWidth = boxView.widthAnchor.constraint(greaterThanOrEqualToConstant: 0)
        boxViewWidth.isActive = true
        boxViewWidth.priority = .defaultLow

        boxView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        boxView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        boxView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        DispatchQueue.main.async {
            self.boxView.addDropShadow(shadow_color: UIColor.lightGray, offset: CGSize(width: 0, height: 2), shadow_radius: 7.0, shadow_opacity: 0.4, corner_radius: 10.0, shadow_path: UIBezierPath(rect: self.boxView.bounds))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
