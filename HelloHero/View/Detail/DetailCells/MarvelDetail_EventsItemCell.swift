//
//  MarvelDetail_EventsItemCell.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation
import UIKit

extension MarvelDetail_EventsItemCell {
    func loadUI() {
        setupLbl()
    }
    func setupLbl() {
        constrainLbl()
        if self.eventItem.Name.isEmpty {
            self.lbl.text = "   No se encontraron datos."
            self.lbl.textColor = UIColor.darkGray
            self.lbl.font = UIFont.italicSystemFont(ofSize: 15.0)
        } else {
            self.lbl.text = "• \(self.eventItem.Name)"
        }
    }
    func constrainLbl() {
        self.contentView.addSubview(self.lbl)
        self.lbl.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8.0).isActive = true
        self.lbl.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8.0).isActive = true
        self.lbl.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
    }
}
extension MarvelDetail_EventsItemCell: MarvelDetail_EventsCell_ReloadDelegate {
    func marvelDetail_EventsCell_Reload(eventItem: MarvelEventItem) {
        self.eventItem = eventItem
        self.loadUI()
    }
}
protocol MarvelDetail_EventsCell_ReloadDelegate {
    func marvelDetail_EventsCell_Reload(eventItem: MarvelEventItem)
}
public class MarvelDetail_EventsItemCell: UITableViewCell {
    
    public static let identifier = "MarvelDetail_EventsItemCell"
    public static let height = CGFloat(23.0)
    
    var eventItem = MarvelEventItem()
    
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
        
        self.selectionStyle = .none
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}
