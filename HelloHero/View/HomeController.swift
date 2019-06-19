//
//  ViewController.swift
//  HelloHero
//
//  Created by Memo on 6/17/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import UIKit
import SDWebImage

extension HomeController: UITableViewDataSourcePrefetching {
    public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
        if self.config.ArrResults.count > 1000 {
            // Omitir...
        } else {

            self.offset += 10
            //self.limit = 10
            MarvelServices.characterList(self.offset, self.limit, completion: { (myData) in
                if let data = myData {
                    
                    print(data.ArrResults)
                    self.config.ArrResults += data.ArrResults
                    print(self.config.ArrResults.count)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }

                } else {
                    print("error")
                    self.offset -= 10
                }
            })
        }


    }
}

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
    func setupTableView() {
        constrainTableView()
        
        // Fix Space top
        self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: 0.01))
        //self.tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: 0.01))
        //self.tableView.contentInset = UIEdgeInsets(top: -35, left: 0, bottom: 0, right: 0);

        //self.tableView.contentInsetAdjustmentBehavior = .never
        
        self.tableView.register(MarvelCell.self, forCellReuseIdentifier: MarvelCell.identifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.prefetchDataSource = self
    }
    func constrainTableView() {
        self.view.addSubview(self.tableView)

        if #available(iOS 11.0, *) {
            self.tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 0.0).isActive = true
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0.0).isActive = true
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0).isActive = true
            self.tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 0.0).isActive = true
        } else {
            self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0.0).isActive = true
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.0).isActive = true
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0).isActive = true
            self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0.0).isActive = true
        }
    }
}

class HomeController: UIViewController {

    var config = MarvelCharacterData()
    
    var bandera = false
    
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
        let ai = UIActivityIndicatorView(style: .whiteLarge)
        ai.translatesAutoresizingMaskIntoConstraints = false
        //ai.backgroundColor = .orange
        return ai
    }()

    func setupActivity() {
        constrainActivity()
    }
    func constrainActivity() {
        self.view.addSubview(self.activity)
        self.activity.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.activity.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    func dataServiceCharacters() {
        DispatchQueue.global(qos: .background).async {
            MarvelServices.characterList(self.offset, self.limit, completion: { (myData) in
                if let data = myData {
                    DispatchQueue.main.async {
                        self.activity.isHidden = true
                        self.activity.stopAnimating()
                        print(data)
                        self.config = data
                        //self.tableView.reloadData()
                        self.setupTableView()
                        
                    }
                } else {
                    DispatchQueue.main.async {
                        self.activity.isHidden = true
                        self.activity.stopAnimating()
                        print("error")
                    }
                }
            })
            DispatchQueue.main.async {
                self.activity.isHidden = false
                self.activity.startAnimating()
            }
        }
    }
    
    var offset = Int(0)
    var limit = Int(10)
    
    func setupNavigationBar() {
        
        self.view.backgroundColor = UIColor.gray

        self.navigationController?.navigationBar.barTintColor = UIColor.red
        //self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let navigationFont = UIFont(name: "Marvel-Regular", size: 28)
        let navigationLargeFont = UIFont(name: "Marvel-Regular", size: 89) //34 is Large Title size by default
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navigationFont!]
        if #available(iOS 11, *){
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: navigationLargeFont!]
        }
        self.title = "MARVEL"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupActivity()

        dataServiceCharacters()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    


}

