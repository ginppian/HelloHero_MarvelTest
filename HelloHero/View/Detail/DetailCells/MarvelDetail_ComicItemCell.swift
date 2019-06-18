//
//  File.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation
import UIKit

extension MarvelDetail_ComicItemCell {
    func loadUI() {
        setupLbl()
    }
    func setupLbl() {
        constrainLbl()
        self.lbl.text = self.comicItem.Name
    }
    func constrainLbl() {
        self.contentView.addSubview(self.lbl)
        self.lbl.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0.0).isActive = true
        self.lbl.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0.0).isActive = true
        self.lbl.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
    }
}

extension MarvelDetail_ComicItemCell: MarvelDetail_ComicCell_ReloadDelegate {
    func marvelDetail_ComicCell_Reload(comicItem: MarvelComicItem) {
        self.comicItem = comicItem
        self.loadUI()
    }
}

protocol MarvelDetail_ComicCell_ReloadDelegate {
    func marvelDetail_ComicCell_Reload(comicItem: MarvelComicItem)
}
public class MarvelDetail_ComicItemCell: UITableViewCell {
    
    public static let identifier = "MarvelDetail_ComicItemCell"
    public static let height = CGFloat(21.0)
    
    var comicItem = MarvelComicItem()
    
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
