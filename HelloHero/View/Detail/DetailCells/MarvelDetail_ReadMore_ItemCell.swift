//
//  MarvelDetail_ReadMore_ItemCell.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation
import UIKit

extension MarvelDetail_ReadMore_ItemCell {
    func loadUI() {
        setupLbl()
    }
    func setupLbl() {
        constrainLbl()
        self.lbl.font = UIFont.italicSystemFont(ofSize: 11.0)
        self.lbl.textColor = UIView().tintColor
        self.lbl.attributedText = NSAttributedString(string: self.marvelUrl.Url, attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue, .underlineColor: UIView().tintColor])
    }
    func constrainLbl() {
        self.contentView.addSubview(self.lbl)
        self.lbl.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8.0).isActive = true
        self.lbl.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8.0).isActive = true
        //self.lbl.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
        self.lbl.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0.0).isActive = true
        self.lbl.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0.0).isActive = true
    }
}

extension MarvelDetail_ReadMore_ItemCell: MarvelDetail_ReadMoreCell_ReloadDelegate {
    func marvelDetail_ReadMoreCell_Reload(marvelUrl: MarvelURL) {
        self.marvelUrl = marvelUrl
        self.loadUI()
    }
}

protocol MarvelDetail_ReadMoreCell_ReloadDelegate {
    func marvelDetail_ReadMoreCell_Reload(marvelUrl: MarvelURL)
}
public class MarvelDetail_ReadMore_ItemCell: UITableViewCell {
    
    public static let height = CGFloat(44.0)
    public static let identifier = "MarvelDetail_ReadMore_ItemCell"
    
    var marvelUrl = MarvelURL()
    
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
