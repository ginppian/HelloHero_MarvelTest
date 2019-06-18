//
//  ViewController.swift
//  HelloHero
//
//  Created by Memo on 6/17/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import UIKit
import SDWebImage

extension HomeController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.config.ArrResults.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MarvelCell.identifier, for: indexPath) as? MarvelCell {
            // protocol
            self.reloadMarvelCellDelegate = cell
            self.reloadMarvelCellDelegate?.reloadMarvelCell(character: self.config.ArrResults[indexPath.row])

            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.accessoryType = .disclosureIndicator
        cell.contentView.superview?.backgroundColor = UIColor.clear
    }

}
extension HomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MarvelCell.height
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let vc = MarvelDetailController(character: self.config.ArrResults[indexPath.row])
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension HomeController {
    func setupUI() {
        setupView() // HomeViewController
        setupTableView() // TableView
    }
    func setupView() {
        self.view.backgroundColor = .white
    }
    func setupTableView() {
        constrainTableView()
        
        // Fix Space top
        self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: 0.01))
        //self.tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: 0.01))
        //self.tableView.contentInset = UIEdgeInsets(top: -35, left: 0, bottom: 0, right: 0);

        self.tableView.register(MarvelCell.self, forCellReuseIdentifier: MarvelCell.identifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    func constrainTableView() {
        self.view.addSubview(self.tableView)
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0.0).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 0.0).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 0.0).isActive = true
    }
}

class HomeController: UIViewController {

    var config = MarvelCharacterData()

    var reloadMarvelCellDelegate: ReloadMarvelCell?
    
    var tableView: UITableView = {
        let t = UITableView(frame: CGRect.zero, style: .grouped)
        t.translatesAutoresizingMaskIntoConstraints = false
        t.backgroundColor = UIColor.grayMarvel
        t.showsVerticalScrollIndicator = false
        t.showsHorizontalScrollIndicator = false
        t.bounces = true
        return t
    }()
    
    var activity: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .gray)
        return ai
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never

        let serviceMarvel = ReadJson.from(file: "characters")
        self.config = serviceMarvel.Data

        self.setupUI()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        
//        let attributes: [NSAttributedString.Key: Any] = [
//            NSAttributedString.Key.font = UIFont(name: "Marvel-Regular", size: 17) ?? UIFont.systemFont(ofSize: 17)
//        ]
//        self.navigationController?.navigationBar.titleTextAttributes = attributes
//
//        self.title = "MARVEL"
        
        
        let navigationFont = UIFont(name: "Marvel-Regular", size: 34)
        let navigationLargeFont = UIFont(name: "Marvel-Regular", size: 89) //34 is Large Title size by default
        
        //navigation.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: navigationFont!]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navigationFont!]

        if #available(iOS 11, *){
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: navigationLargeFont!]
        }
        self.title = "MARVEL"
    }

}

