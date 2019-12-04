//
//  ChangeType.swift
//  MixTape
//
//  Created by Taylor Maxwell on 12/3/19.
//  Copyright © 2019 Taylor Maxwell. All rights reserved.
//

import Foundation

/// Possible values for a change
enum ChangeType: String {
  case add = "A"
  case delete = "D"
  case update = "U"
  
  var description: String {
      return self.rawValue
  }
  
}
