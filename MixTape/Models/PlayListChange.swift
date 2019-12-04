//
//  PlayListChange.swift
//  MixTape
//
//  Created by Taylor Maxwell on 12/3/19.
//  Copyright © 2019 Taylor Maxwell. All rights reserved.
//

import Foundation

/// Change to the play list change
struct PlayListChange: Codable {
  
  /// Kind of change
  let change: String
  
  /// Updated or new play list information
  let playlist: PlayList
  
}
