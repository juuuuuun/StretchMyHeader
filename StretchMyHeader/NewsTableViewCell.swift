//
//  NewsTableViewCell.swift
//  StretchMyHeader
//
//  Created by Jun Oh on 2019-02-19.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
  
  // MARK: Properties
  
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var headlineLabel: UILabel!
  
  var news: NewsItem?
  
  // MARK: UITableViewCell methods
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  // MARK: Configuration Methods
  
  func configureCell() {
    guard let news = news else {
      fatalError("News is nil")
    }
    categoryLabel.text = news.category.rawValue
    categoryLabel.textColor = news.category.categoryColor()
    headlineLabel.text = news.headline
  }

}
