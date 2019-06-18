//
//  MarvelCell.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation
import SDWebImage

extension MarvelCell {
    func setupUI() {
        setupImgV()
        setupLbl()
        self.contentView.backgroundColor = UIColor.grayMarvel
    }
    func setupImgV() {
        constrainImgV()
        let urlStr = "\(self.character.Thumbnail.Path).\(self.character.Thumbnail.Extension)"
        self.imgV.sd_setImage(with: URL(string: urlStr), placeholderImage: UIImage(named: "ironMan"))
    }
    func constrainImgV() {
        self.contentView.addSubview(self.imgV)
        self.imgV.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
        self.imgV.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8.0).isActive = true
        self.imgV.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.imgV.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.imgV.layer.cornerRadius = 8.0
    }
    func setupLbl() {
        constrainLbl()
        self.lbl.text = self.character.Name
        self.lbl.backgroundColor = UIColor.redMarvel
    }
    func constrainLbl() {
        self.contentView.addSubview(self.lbl)
        self.lbl.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
        self.lbl.leftAnchor.constraint(equalTo: self.imgV.rightAnchor, constant: 8.0).isActive = true
        self.lbl.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8.0).isActive = true
    }
}
protocol ReloadMarvelCell {
    func reloadMarvelCell(character: MarvelCharacter)
}
extension MarvelCell: ReloadMarvelCell {
    func reloadMarvelCell(character: MarvelCharacter) {
        self.character = character
        self.setupUI()
    }
}
public class MarvelCell: UITableViewCell {
    
    public static let identifier = "HomeCell"
    public static let height = CGFloat(89.0)
    
    var character = MarvelCharacter()
    
    var lbl: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.lineBreakMode = .byWordWrapping
        l.textAlignment = .left
        l.sizeToFit()
        return l
    }()
    
    var imgV: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.contentMode = .scaleAspectFit
        i.clipsToBounds = true
        return i
    }()
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}
