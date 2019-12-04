//
//  Changes.swift
//  MixTape
//
//  Created by Taylor Maxwell on 12/3/19.
//  Copyright © 2019 Taylor Maxwell. All rights reserved.
//

import Foundation

/// Contains changes to make to the current mix list
struct Changes: Codable {
  
  /// Changes to make to users
  let userChanges: [UserChange]
  
  // Changes to make to songs
  let songChanges: [SongChange]
  
  // Changes to make to play lists
  let playListChanges: [PlayListChange]
  
  
  // MARK: Methods
  
  
  /// Associated Changes
  /// - Parameters:
  ///   - userChanges: User changes or empty
  ///   - songChanges: Song changes or empty
  ///   - playListChanges: Play list changes or empty
  init(userChanges: [UserChange], songChanges: [SongChange], playListChanges: [PlayListChange]) {
    
    self.userChanges = userChanges
    self.songChanges = songChanges
    self.playListChanges = playListChanges
    
  }
  
  /// Coding key mappings
  enum CodingKeys: String, CodingKey {
    case userchanges = "userChanges"
    case playlistchanges = "playListChanges"
    case songchanges = "songChanges"
  }
  
  /// Handles deserializing json
  /// - Parameter decoder: passed reference to decoder
  init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.userChanges = try container.decode([UserChange].self, forKey: .userchanges)
    self.playListChanges = try container.decode([PlayListChange].self, forKey: .playlistchanges)
    self.songChanges = try container.decode([SongChange].self, forKey: .songchanges)
  }
  
  
  /// Handles serializing current instance
  /// - Parameter encoder: passed encoder reference
  func encode(to encoder: Encoder) throws {
    
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.userChanges, forKey: .userchanges)
    try container.encode(self.playListChanges, forKey: .playlistchanges)
    try container.encode(self.songChanges, forKey: .songchanges)
    
  }
}
