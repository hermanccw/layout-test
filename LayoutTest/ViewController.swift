//
//  ViewController.swift
//  LayoutTest
//
//  Created by Herman Chan on 2018-02-28.
//  Copyright © 2018 Herman Chan. All rights reserved.
//

import UIKit
import Layout

struct ViewData {
  var name: String?
  var count: Int
}

class ViewController:
  UIViewController,
  LayoutLoading,
  UITableViewDataSource,
  UITableViewDelegate {
  
  
  @objc var tableView: UITableView?
  var data: ViewData? {
    didSet {
//      if !isViewLoaded { return }
      tableView?.reloadData()
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    edgesForExtendedLayout = []
    loadLayout(
      named: "VC.xml"
    )
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let d = data else {
      return 0
    }
    return d.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let node = tableView.dequeueReusableCellNode(withIdentifier: "supporterCell", for: indexPath)
    
    // force unwrap here shoudl be fine
    node.setState(["name":"me"])
    
    // Cast the node view to a table cell and return it
    return node.view as! UITableViewCell
  }
  
}
