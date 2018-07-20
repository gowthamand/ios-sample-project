//
//  PostsViewController.swift
//  NavigationController
//
//  Created by Gowthaman D on 03/05/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//
import UIKit
import Material
import Graph

class PostsViewController: UIViewController {
    internal var category: String
    
    internal var graph: Graph!
    internal var search: Search<Entity>!
    
    internal var data: [Entity] {
        guard let category = search.sync().first else {
            return [Entity]()
        }
        
        let posts = category.relationship(types: "Post").subject(types: "Article")
        
        return posts.sorted { (a, b) -> Bool in
            return a.createdDate < b.createdDate
        }
    }
    
    internal var tableView: CardTableView!
    
    required init?(coder aDecoder: NSCoder) {
        category = ""
        super.init(coder: aDecoder)
        prepareTabItem()
    }
    
    init(category: String) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
        prepareTabItem()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.blueGrey.lighten5
        
        // Model.
        prepareGraph()
        prepareSearch()
        
        // Feed.
        prepareTableView()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadData()
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        reloadData()
    }
}

extension PostsViewController {
    internal func prepareGraph() {
        graph = Graph()
    }
    
    internal func prepareSearch() {
        search = Search<Entity>(graph: graph).for(types: "Category").where(properties: ("name", category))
    }
}

extension PostsViewController {
    internal func prepareTabItem() {
        tabItem.title = category
        tabItem.titleColor = .white
    }
}

extension PostsViewController {
    internal func prepareTableView() {
        tableView = CardTableView()
        view.layout(tableView).edges()
    }
    
    internal func reloadData() {
//        guard let toolbar = toolbarController?.toolbar else {
//            return
//        }
        
        tableView.data = data
        
//        toolbar.detail = "\(tableView.data.count) " + (1 == tableView.data.count ? "Article" : "Articles")
    }
}
