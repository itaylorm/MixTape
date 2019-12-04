//
//  PlayList.swift
//  MixTape
//
//  Created by Taylor Maxwell on 12/3/19.
//  Copyright © 2019 Taylor Maxwell. All rights reserved.
//

import Foundation

/// Represents a person who can have play list selections
struct PlayList: Codable, Equatable {
  
  /// Unique identifier for user
  let id: String
  
  /// Name of user
  let user_id: String
  
  /// Associated songs
  var song_ids: [String]
  
  /// Returns true if the Ids match
  /// - Parameters:
  ///   - lhs: playlist to compare on left
  ///   - rhs: playlist to compare on right
  static func ==(lhs: PlayList, rhs: PlayList) -> Bool {
      return lhs.id == rhs.id
  }
  
}
