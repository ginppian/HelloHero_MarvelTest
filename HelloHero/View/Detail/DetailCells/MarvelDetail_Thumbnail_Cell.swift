//
//  MarvelDetail_Thumbnail_Cell.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation
import UIKit

extension MarvelDetail_Thumbnail_Cell {
    func loadUI() {
        //setupLbl()
        setupImgV()
    }
    func setupImgV() {
        constrainImgV()
        //self.imgV.backgroundColor = .orange
        let urlStr = "\(self.thumbnail.Path).\(self.thumbnail.Extension)"
        self.imgV.sd_setImage(with: URL(string: urlStr), placeholderImage: UIImage(named: Random.WaitingImg()))

    }
    func constrainImgV() {
        self.contentView.addSubview(self.imgV)
        self.imgV.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0.0).isActive = true
        self.imgV.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0.0).isActive = true
        self.imgV.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0.0).isActive = true
        self.imgV.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0.0).isActive = true
    }
    func setupLbl() {
        constrainLbl()
        self.lbl.text = self.name
    }
    func constrainLbl() {
        self.contentView.addSubview(self.lbl)
        self.lbl.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0.0).isActive = true
        self.lbl.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0.0).isActive = true
        self.lbl.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
    }
}
extension MarvelDetail_Thumbnail_Cell: MarvelDetail_ThumbnailCell_ReloadDelegate {
    func marvelDetail_ThumbnailCell_ReloadDelegate(thumbnail: MarvelThumbnail, name: String) {
        self.thumbnail = thumbnail
        self.name = name
        self.loadUI()
    }
}

protocol MarvelDetail_ThumbnailCell_ReloadDelegate {
    func marvelDetail_ThumbnailCell_ReloadDelegate(thumbnail: MarvelThumbnail, name: String)
}
public class MarvelDetail_Thumbnail_Cell: UITableViewCell {
    
    public static let identifier = "MarvelDetail_Thumbnail_Cell"
    public static let height = CGFloat(377.0)
    
    var thumbnail = MarvelThumbnail()
    var name = String()
    
    var imgV: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.clipsToBounds = true
        i.contentMode = .scaleAspectFill
        return i
    }()
    
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
