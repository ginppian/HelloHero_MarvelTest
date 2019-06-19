//
//  MarvelDetailController.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation
import UIKit

extension MarvelDetailController: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return MarvelDetailEnum.allCases.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case MarvelDetailEnum.thumbnail.rawValue:
            return 1
        case MarvelDetailEnum.description.rawValue:
            return 1
        case MarvelDetailEnum.comics.rawValue:
            if self.character.Comics.Items.isEmpty {
                return 1
            }
            return self.character.Comics.Items.count
        case MarvelDetailEnum.series.rawValue:
            if self.character.Series.Items.isEmpty {
                return 1
            }
            return self.character.Series.Items.count
        case MarvelDetailEnum.stories.rawValue:
            if self.character.Stories.Items.isEmpty {
                return 1
            }
            return self.character.Stories.Items.count
        case MarvelDetailEnum.events.rawValue:
            if self.character.Events.Items.isEmpty {
                return 1
            } else {
                return self.character.Events.Items.count
            }
        case MarvelDetailEnum.readMore.rawValue:
            return self.character.Urls.count
        default:
            return Int()
        }
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case MarvelDetailEnum.thumbnail.rawValue:
            return self.character.Name
        case MarvelDetailEnum.description.rawValue:
            return "¿Quién es?"
        case MarvelDetailEnum.comics.rawValue:
            return "Comics donde aparece:"
        case MarvelDetailEnum.series.rawValue:
            return "Series donde aparece:"
        case MarvelDetailEnum.stories.rawValue:
            return "Historias relacionadas:"
        case MarvelDetailEnum.events.rawValue:
            return "Eventos relacionados:"
        case MarvelDetailEnum.readMore.rawValue:
            return "Leer más..."
        default:
            return nil
        }
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case MarvelDetailEnum.thumbnail.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MarvelDetail_Thumbnail_Cell.identifier,
                                                        for: indexPath) as? MarvelDetail_Thumbnail_Cell {
                self.marvelDetail_ThumbnailCell_ReloadDelegate = cell
                self.marvelDetail_ThumbnailCell_ReloadDelegate?.marvelDetail_ThumbnailCell_ReloadDelegate(thumbnail: self.character.Thumbnail,
                                                                                                          name: self.character.Name)
                return cell
            }
            return UITableViewCell()
        case MarvelDetailEnum.description.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MarvelDetail_Description_Cell.identifier,
                                                        for: indexPath) as? MarvelDetail_Description_Cell {
                self.marvelDetail_Description_CellDelegate = cell
                self.marvelDetail_Description_CellDelegate?.marvelDetail_Description_CellDelegate(_description: self.character.Description)
                
                return cell
            }
            return UITableViewCell()
        case MarvelDetailEnum.comics.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MarvelDetail_ComicItemCell.identifier,
                                                        for: indexPath) as? MarvelDetail_ComicItemCell {
                
                if self.character.Comics.Items.isEmpty {
                    self.marvelDetail_ComicCell_ReloadDelegate = cell
                    self.marvelDetail_ComicCell_ReloadDelegate?.marvelDetail_ComicCell_Reload(comicItem: MarvelComicItem())
                } else {
                    self.marvelDetail_ComicCell_ReloadDelegate = cell
                    self.marvelDetail_ComicCell_ReloadDelegate?.marvelDetail_ComicCell_Reload(comicItem: self.character.Comics.Items[indexPath.row])
                }

                return cell
            }
            return UITableViewCell()
        case MarvelDetailEnum.series.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MarvelDetail_SeriesItemCell.identifier,
                                                        for: indexPath) as? MarvelDetail_SeriesItemCell {
                if self.character.Series.Items.isEmpty {
                    self.marvelDetail_SeriesCell_ReloadDelegate = cell
                    self.marvelDetail_SeriesCell_ReloadDelegate?.marvelDetail_SeriesCell_Reload(serieItem: MarvelSerieItem())
                } else {
                    self.marvelDetail_SeriesCell_ReloadDelegate = cell
                    self.marvelDetail_SeriesCell_ReloadDelegate?.marvelDetail_SeriesCell_Reload(serieItem: self.character.Series.Items[indexPath.row])
                }

                return cell
            }
            return UITableViewCell()
        case MarvelDetailEnum.stories.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MarvelDetail_StoriesItemCell.identifier,
                                                        for: indexPath) as? MarvelDetail_StoriesItemCell {
                
                if self.character.Stories.Items.isEmpty {
                    self.marvelDetail_StorieCell_ReloadDelegate = cell
                    self.marvelDetail_StorieCell_ReloadDelegate?.marvelDetail_StorieCell_Reload(storieItem: MarvelStorieItem())
                } else {
                    self.marvelDetail_StorieCell_ReloadDelegate = cell
                    self.marvelDetail_StorieCell_ReloadDelegate?.marvelDetail_StorieCell_Reload(storieItem: self.character.Stories.Items[indexPath.row])
                }
                
                return cell
            }
            return UITableViewCell()
        case MarvelDetailEnum.events.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MarvelDetail_EventsItemCell.identifier,
                                                        for: indexPath) as? MarvelDetail_EventsItemCell {
                
                if self.character.Events.Items.isEmpty {
                    self.marvelDetail_EventsCell_ReloadDelegate = cell
                    self.marvelDetail_EventsCell_ReloadDelegate?.marvelDetail_EventsCell_Reload(eventItem: MarvelEventItem())
                } else {
                    self.marvelDetail_EventsCell_ReloadDelegate = cell
                    self.marvelDetail_EventsCell_ReloadDelegate?.marvelDetail_EventsCell_Reload(eventItem: self.character.Events.Items[indexPath.row])
                }
                return cell
            }
            return UITableViewCell()
        case MarvelDetailEnum.readMore.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MarvelDetail_ReadMore_ItemCell.identifier,
                                                        for: indexPath) as? MarvelDetail_ReadMore_ItemCell {
                self.marvelDetail_ReadMoreCell_ReloadDelegate = cell
                self.marvelDetail_ReadMoreCell_ReloadDelegate?.marvelDetail_ReadMoreCell_Reload(marvelUrl: self.character.Urls[indexPath.row])
                return cell
            }
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
}
extension MarvelDetailController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case MarvelDetailEnum.thumbnail.rawValue:
            return MarvelDetail_Thumbnail_Cell.height
        case MarvelDetailEnum.description.rawValue:
//            return MarvelDetail_Description_Cell.height
            return UITableView.automaticDimension
        case MarvelDetailEnum.comics.rawValue:
            return MarvelDetail_ComicItemCell.height
//            return UITableView.automaticDimension
        case MarvelDetailEnum.series.rawValue:
            return MarvelDetail_SeriesItemCell.height
//            return UITableView.automaticDimension
        case MarvelDetailEnum.stories.rawValue:
            return MarvelDetail_StoriesItemCell.height
//            return UITableView.automaticDimension
        case MarvelDetailEnum.events.rawValue:
            return MarvelDetail_EventsItemCell.height
//            return UITableView.automaticDimension
        case MarvelDetailEnum.readMore.rawValue:
            return MarvelDetail_ReadMore_ItemCell.height
//            return UITableView.automaticDimension
        default:
            return CGFloat()
        }
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case MarvelDetailEnum.thumbnail.rawValue:
            self.tableView.deselectRow(at: indexPath, animated: true)
        case MarvelDetailEnum.description.rawValue:
            self.tableView.deselectRow(at: indexPath, animated: true)
        case MarvelDetailEnum.comics.rawValue:
            self.tableView.deselectRow(at: indexPath, animated: true)
        case MarvelDetailEnum.series.rawValue:
            self.tableView.deselectRow(at: indexPath, animated: true)
        case MarvelDetailEnum.stories.rawValue:
            self.tableView.deselectRow(at: indexPath, animated: true)
        case MarvelDetailEnum.events.rawValue:
            self.tableView.deselectRow(at: indexPath, animated: true)
        case MarvelDetailEnum.readMore.rawValue:
            self.tableView.deselectRow(at: indexPath, animated: true)
            
            let urlStr = self.character.Urls[indexPath.row].Url
            guard let url = URL(string: urlStr) else { return }
            UIApplication.shared.open(url)
        default:
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
extension MarvelDetailController {
    func setupUI() {
        setupView() // HomeViewController
        setupTableView() // TableView
    }
    func setupView() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }
    func setupTableView() {
        
        constrainTableView()
        
        self.tableView.register(MarvelDetail_Thumbnail_Cell.self, forCellReuseIdentifier: MarvelDetail_Thumbnail_Cell.identifier)
        self.tableView.register(MarvelDetail_Description_Cell.self, forCellReuseIdentifier: MarvelDetail_Description_Cell.identifier)
        self.tableView.register(MarvelDetail_ComicItemCell.self, forCellReuseIdentifier: MarvelDetail_ComicItemCell.identifier)
        self.tableView.register(MarvelDetail_SeriesItemCell.self, forCellReuseIdentifier: MarvelDetail_SeriesItemCell.identifier)
        self.tableView.register(MarvelDetail_StoriesItemCell.self, forCellReuseIdentifier: MarvelDetail_StoriesItemCell.identifier)
        self.tableView.register(MarvelDetail_EventsItemCell.self, forCellReuseIdentifier: MarvelDetail_EventsItemCell.identifier)
        self.tableView.register(MarvelDetail_ReadMore_ItemCell.self, forCellReuseIdentifier: MarvelDetail_ReadMore_ItemCell.identifier)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    func constrainTableView() {
        self.view.addSubview(self.tableView)
        if #available(iOS 11.0, *) {
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0.0).isActive = true
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0).isActive = true
            self.tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 0.0).isActive = true
            self.tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 0.0).isActive = true
        } else {
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.0).isActive = true
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0).isActive = true
            self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0.0).isActive = true
            self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0.0).isActive = true
        }
    }
}

public class MarvelDetailController: UIViewController {
    
    var tableView: UITableView = {
        let t = UITableView(frame: CGRect.zero, style: .plain)
        t.translatesAutoresizingMaskIntoConstraints = false
        t.backgroundColor = UIColor.grayMarvel
        t.showsVerticalScrollIndicator = false
        t.showsHorizontalScrollIndicator = false
        t.bounces = false
        return t
    }()
    
    var character = MarvelCharacter()
    
    // Protocols
    var marvelDetail_ThumbnailCell_ReloadDelegate: MarvelDetail_ThumbnailCell_ReloadDelegate?
    var marvelDetail_Description_CellDelegate: MarvelDetail_Description_CellDelegate?
    var marvelDetail_ComicCell_ReloadDelegate: MarvelDetail_ComicCell_ReloadDelegate?
    var marvelDetail_SeriesCell_ReloadDelegate: MarvelDetail_SeriesCell_ReloadDelegate?
    var marvelDetail_StorieCell_ReloadDelegate: MarvelDetail_StorieCell_ReloadDelegate?
    var marvelDetail_EventsCell_ReloadDelegate: MarvelDetail_EventsCell_ReloadDelegate?
    var marvelDetail_ReadMoreCell_ReloadDelegate: MarvelDetail_ReadMoreCell_ReloadDelegate?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }

    convenience init(character: MarvelCharacter) {
        self.init()
        self.character = character
    }
    
}
