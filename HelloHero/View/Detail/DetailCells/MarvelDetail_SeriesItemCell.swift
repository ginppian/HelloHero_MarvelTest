//
//  MarvelDetail_SeriesItemCell.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation
import UIKit

extension MarvelDetail_SeriesItemCell {
    func loadUI() {
        setupLbl()
    }
    func setupLbl() {
        constrainLbl()
        self.lbl.text = self.serieItem.Name
    }
    func constrainLbl() {
        self.contentView.addSubview(self.lbl)
        self.lbl.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0.0).isActive = true
        self.lbl.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0.0).isActive = true
        self.lbl.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
    }
}
extension MarvelDetail_SeriesItemCell: MarvelDetail_SeriesCell_ReloadDelegate {
    func marvelDetail_SeriesCell_Reload(serieItem: MarvelSerieItem) {
        self.serieItem = serieItem
        self.loadUI()
    }
}
protocol MarvelDetail_SeriesCell_ReloadDelegate {
    func marvelDetail_SeriesCell_Reload(serieItem: MarvelSerieItem)
}

public class MarvelDetail_SeriesItemCell: UITableViewCell {
    
    public static let identifier = "MarvelDetail_SeriesItemCell"
    public static let height = CGFloat(21.0)
    
    var serieItem = MarvelSerieItem()
    
    var lbl: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.lineBreakMode = .byWordWrapping
        l.textAlignment = .left
        l.sizeToFit()
        return l
    }()
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}
