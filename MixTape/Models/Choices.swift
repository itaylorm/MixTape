//
//  Choices.swift
//  MixTape
//
//  Created by Taylor Maxwell on 12/3/19.
//  Copyright © 2019 Taylor Maxwell. All rights reserved.
//

import Foundation

/// Represents a person who can have play list selections
class Choices: Codable {
  
  /// Associated people who can have play lists
  var users: [User]
  
  /// User Song choices groupings
  var playLists: [PlayList]
  
  /// Available songs
  var songs: [Song]

  // MARK: Methods
  
  /// Coding key mappings
  enum CodingKeys: String, CodingKey {
    case users = "users"
    case playlists = "playlists"
    case songs = "songs"
  }
  
  /// Handles deserializing json
  /// - Parameter decoder: passed reference to decoder
  required init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.users = try container.decode([User].self, forKey: .users)
    self.playLists = try container.decode([PlayList].self, forKey: .playlists)
    self.songs = try container.decode([Song].self, forKey: .songs)
  }
  
  
  /// Handles serializing current instance
  /// - Parameter encoder: passed encoder reference
  func encode(to encoder: Encoder) throws {
    
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.users, forKey: .users)
    try container.encode(self.playLists, forKey: .playlists)
    try container.encode(self.songs, forKey: .songs)
    
  }
  
}
