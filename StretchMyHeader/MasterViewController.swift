//
//  MasterViewController.swift
//  StretchMyHeader
//
//  Created by Jun Oh on 2019-02-19.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
  
  // MARK: Constants
  
  private let kTableHeaderHeight: CGFloat = 300.0
  private let kTableHeaderCutAway: CGFloat = 80.0
  
  // MARK: Properties
  
  var newsManager: NewsManager!
  
  var headerMaskLayer: CAShapeLayer!
  
  @IBOutlet weak var customHeaderView: UIView!
  @IBOutlet weak var dateLabel: UILabel!
  
  // MARK: ViewController Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    newsManager = NewsManager()
    
    let today = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM d"
    dateLabel.text = formatter.string(from: today)
    
    tableView.tableHeaderView = nil
    tableView.addSubview(customHeaderView)
    customHeaderView.frame.origin.y = -kTableHeaderHeight
    
    let effectiveHeight = kTableHeaderHeight - kTableHeaderCutAway/2
    
    tableView.contentInset = UIEdgeInsets(top: effectiveHeight, left: 0.0, bottom: 0.0, right: 0.0)
    tableView.contentOffset = CGPoint(x: 0.0, y: -effectiveHeight)
    
    headerMaskLayer = CAShapeLayer()
    headerMaskLayer.fillColor = UIColor.black.cgColor
    customHeaderView.layer.mask = headerMaskLayer
    updateHeaderView()
  }
  
  // MARK: - Table View
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return newsManager.allNews.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? NewsTableViewCell else {
      fatalError("Could not dequeue")
    }
    
    cell.news = newsManager.allNews[indexPath.row]
    cell.configureCell()
    
    return cell
  }
  
  // MARK: ScrollView delegate methods
  
  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    updateHeaderView()
  }
  
  // MARK: Private Methods
  
  func updateHeaderView() {
    let effectiveHeight = kTableHeaderHeight - kTableHeaderCutAway/2
    if tableView.contentOffset.y >= -effectiveHeight {
      customHeaderView.frame.origin.y = -effectiveHeight
    } else {
      customHeaderView.frame = CGRect(x: customHeaderView.frame.origin.x, y: tableView.contentOffset.y, width: customHeaderView.frame.width, height: -tableView.contentOffset.y + kTableHeaderCutAway/2)
    }
    
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: customHeaderView.frame.width, y: 0))
    path.addLine(to: CGPoint(x: customHeaderView.frame.width, y: customHeaderView.frame.height))
    path.addLine(to: CGPoint(x: 0, y: customHeaderView.frame.height - kTableHeaderCutAway))
    headerMaskLayer?.path = path.cgPath
  }
  
}

