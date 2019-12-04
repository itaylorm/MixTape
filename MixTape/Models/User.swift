//
//  Models.swift
//  MixTape
//
//  Created by Taylor Maxwell on 12/3/19.
//  Copyright © 2019 Taylor Maxwell. All rights reserved.
//

import Foundation

/// Represents a person who can have play list selections
struct User: Codable {
  
  /// Unique identifier for user
  let id: String
  
  /// Name of user
  let name: String
  
}
