//
//  ManagerCollectionController.swift
//  SwiftlyAdds
//
//  Created by MARIJAN VUKCEVICH on 5/28/21.
//

import UIKit


class ManagerCollectionController: UICollectionViewController {
    

    var managerModel:ManagerSpecialsModel?
    
    var managerSpecials: [ManagerSpecial]?

   // GridCollectionViewLayout
    var layout: GridCollectionViewLayout = {
        let layout = GridCollectionViewLayout(numberOfColumns: 2)
        return layout
    }()
   
    //Grid - options:
    private let columnSpans = [[2, 1, 2]] //[[2, 1]]
    private let alignments: [GridCollectionViewLayout.Alignment] = [.top]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        managerSpecials = managerModel?.managerSpecials
       
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.delegate = self //Grid
        collectionView.delegate   = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .white 
        
        collectionView!.register(ManagerCollectionCell.self, forCellWithReuseIdentifier: ManagerCollectionCell.reuseIdentifier)
        self.view.addSubview(collectionView)
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return managerSpecials?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ManagerCollectionCell.reuseIdentifier, for: indexPath) as! ManagerCollectionCell
    
        let managerSpecial = managerSpecials?[indexPath.row]
        let managerAddViewModel = ManagerCellAddViewModel(managerSpecial: managerSpecial, canvasUnit:managerModel?.canvasUnit )
        cell.managerAddViewModel =  managerAddViewModel
    
        return cell
    }
}

extension ManagerCollectionController: GridCollectionViewLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, columnSpanForItemAt index: GridIndex, indexPath: IndexPath) -> Int {
        let spans = columnSpans[indexPath.section]
        let span = spans[indexPath.row % spans.count]
        
        return span
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForItemAt index: GridIndex, indexPath: IndexPath) -> CGFloat {
        let columnHeight = self.collectionView(collectionView, heightForRow: index.row)
        return (index.column + index.row).isMultiple(of: 2) ? columnHeight : columnHeight
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForRow row: Int) -> CGFloat {
      
        let boundsWidth = UIScreen.main.bounds.width
        let baseUnit = boundsWidth / CGFloat(managerModel?.canvasUnit ?? 0)
        let managerSpecial =  managerSpecials?[row]
        let boxViewHeight =  baseUnit * CGFloat(managerSpecial?.height ?? 0)
    
        let height = (boxViewHeight < 175) ? 195 : boxViewHeight
        return row.isMultiple(of: 2) ? height : height
    }
    
    func collectionView(_ collectionView: UICollectionView, alignmentForSection section: Int) -> GridCollectionViewLayout.Alignment {
        return alignments[section]
    }
    
}

