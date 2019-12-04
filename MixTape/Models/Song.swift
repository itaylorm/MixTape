//
//  Song.swift
//  MixTape
//
//  Created by Taylor Maxwell on 12/3/19.
//  Copyright © 2019 Taylor Maxwell. All rights reserved.
//

import Foundation

/// Represents a person who can have play list selections
struct Song: Codable {
  
  /// Unique identifier for song
  let id: String
  
  /// Name of artist
  let artist: String
  
  /// Name of song
  let title: String
  
}
