//
//  NewsItem.swift
//  StretchMyHeader
//
//  Created by Jun Oh on 2019-02-19.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

import UIKit

struct NewsItem {

  enum Categories: String {
    case World = "World"
    case Americas = "Americas"
    case Europe = "Europe"
    case MiddleEast = "Middle East"
    case Africa = "Africa"
    case AsiaPacific = "Asia Pacific"
    
    func categoryColor() -> UIColor {
      switch self {
      case .World:
        return .red
      case .Americas:
        return .blue
      case .Europe:
        return .green
      case .MiddleEast:
        return .yellow
      case .Africa:
        return .orange
      case .AsiaPacific:
        return .purple
      }
    }
  }
  
  let category: Categories
  let headline: String
}
