//
//  Updates.swift
//  MixTape
//
//  Created by Taylor Maxwell on 12/3/19.
//  Copyright © 2019 Taylor Maxwell. All rights reserved.
//

import Foundation

/// Change to the user change
struct UserChange: Codable {
  
  /// Kind of change
  let change: String
  
  /// Updated or new user information
  let user: User
  
}
