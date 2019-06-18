//
//  MarvelDetail_Description_Cell.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation
import UIKit

extension MarvelDetail_Description_Cell {
    func loadUI() {
        setupLbl()
    }
    func setupLbl() {
        constrainLbl()
        self.lbl.text = self._description
    }
    func constrainLbl() {
        self.contentView.addSubview(self.lbl)
        self.lbl.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0.0).isActive = true
        self.lbl.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0.0).isActive = true
        self.lbl.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
    }
}

extension MarvelDetail_Description_Cell: MarvelDetail_Description_CellDelegate {
    func marvelDetail_Description_CellDelegate(_description: String) {
        self._description = _description
        self.loadUI()
    }
}

protocol MarvelDetail_Description_CellDelegate {
    func marvelDetail_Description_CellDelegate(_description: String)
}
public class MarvelDetail_Description_Cell: UITableViewCell {
    
    public static let height = CGFloat(55.0)
    public static let identifier = "MarvelDetail_Description_Cell"
    
    var _description = String()
    
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
