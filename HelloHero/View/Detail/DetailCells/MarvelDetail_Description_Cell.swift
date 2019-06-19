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
        if self._description.isEmpty {
            self.lbl.text = "   No se encontraron datos."
            self.lbl.textColor = UIColor.darkGray
            self.lbl.font = UIFont.italicSystemFont(ofSize: 15.0)
        } else {
            self.lbl.text = "■ \(self._description)"
        }
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
    
    public static let height = CGFloat(89.0)
    public static let identifier = "MarvelDetail_Description_Cell"
    
    var _description = String()
    
    var lbl: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        //.lineBreakMode = .byWordWrapping
        l.textAlignment = .justified
        l.numberOfLines = 100
        l.sizeToFit()
        return l
    }()
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}
