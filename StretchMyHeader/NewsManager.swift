//
//  NewsManager.swift
//  StretchMyHeader
//
//  Created by Jun Oh on 2019-02-19.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

import UIKit

class NewsManager: NSObject {

  var allNews: [NewsItem] = [
    NewsItem(category: .World, headline: "Climate change protests, divestments meet fossil fuels realities"),
    NewsItem(category: .Europe, headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"),
    NewsItem(category: .MiddleEast, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
    NewsItem(category: .Africa, headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
    NewsItem(category: .AsiaPacific, headline: "Despite UN ruling, Japan seeks backing for whale hunting"),
    NewsItem(category: .Americas, headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
    NewsItem(category: .World, headline: "South Africa in $40 billion deal for Russian nuclear reactors"),
    NewsItem(category: .Europe, headline: "'One million babies' created by EU student exchanges")
  ]
  
  
}
