//
//  Processor.swift
//  MixTape
//
//  Created by Taylor Maxwell on 12/3/19.
//  Copyright © 2019 Taylor Maxwell. All rights reserved.
//

import Foundation

/// Handle the serialization, deserialization of files
class Processor {
  
  // MARK: Methods
  
  /// Creates an updated mix tape with changes passed in change file
  /// - Parameters:
  ///   - inputFile: Current Mix tape
  ///   - changeFile: Changes to apply to the mix tape
  ///   - outputFile: The new mix tape
  func update(inputFile: String, changeFile: String, outputFile: String) {
    
    // If the files do not exist stop the updates
    // Warnings are generated in the methods
    if !fileExists(inputFile) || !fileExists(changeFile) {
      return
    }
    
    // Deserialize the input and changes files the
    // unwrap and apply the requested changes
    if let choices: Choices = getData(inputFile), let changes: Changes = getData(changeFile) {
      
      var idsToDelete = [String]()
      for operation in changes.playListChanges {
        
        if operation.change == ChangeType.delete.description {
          
          idsToDelete.append(operation.playlist.id)
          
        } else if operation.change == ChangeType.add.description {
          
          choices.playLists.append(operation.playlist)
          
        } else if operation.change == ChangeType.update.description {
          
          if let index = choices.playLists.firstIndex(where: {$0.id == operation.playlist.id }) {
            choices.playLists[index].song_ids.append(contentsOf: operation.playlist.song_ids)
          }

        }
        
        choices.playLists.removeAll(where: { idsToDelete.contains($0.id)})
        
      }
 
      SaveFile(fileData: choices, file: outputFile)
      
    } else {
      
      print("Invalid files")
      return
      
    }
    
  }
  
  /// Generates a change file for testing
  /// - Parameter outputFilePath: The file to which to save changes
  func generateChangesFile(_ outputFilePath: String) {
    
    let playList4 = PlayList(id: "4", user_id: "4", song_ids: ["1","3","10"])
    let addPlayList4 = PlayListChange(change: ChangeType.add.description, playlist: playList4)
    
    let playList1 = PlayList(id: "1", user_id:"2", song_ids: ["37","1","10","5","7","8"])
    let updatePlayList1 = PlayListChange(change: ChangeType.update.description, playlist: playList1)
    
    let playList2 = PlayList(id: "2", user_id:"3", song_ids: ["38","13","10","5","22","12","25","33","49"])
    let updatePlayList2 = PlayListChange(change: ChangeType.update.description, playlist: playList2)
    
    let playList3 = PlayList(id: "3", user_id:"7", song_ids: [String]())
    let updatePlayList3 = PlayListChange(change: ChangeType.delete.description, playlist: playList3)
    
    let changes = Changes(userChanges: [UserChange](),
                          songChanges: [SongChange](),
                          playListChanges: [updatePlayList2, addPlayList4, updatePlayList1, updatePlayList3])
    
    SaveFile(fileData: changes, file: outputFilePath)
    
  }
  
   /// Deserialize the json file into the value
   /// - Parameter file: Reference to passed input file to be modified
   private func getData<T>(_ inputFile: String) -> T? where T: Codable {
     
     var fileData: T? = nil
     
     do {
       
       // Access the input file's data
       let contents = try String(contentsOfFile: inputFile, encoding: .utf8)
       if let data = contents.data(using: .utf8) {
       
         // Deserialize the choices JSON
         let decoder = JSONDecoder()
         fileData = try decoder.decode(T.self, from: data)
         
       }
       
     } catch let DecodingError.typeMismatch(type, context)  {
        print("Type '\(type)' mismatch:", context.debugDescription)
        print("codingPath:", context.codingPath)
     } catch {
       print(error)
     }
     
     return fileData
     
   }
  
  
  /// Save passed data to the indicated location
  /// - Parameters:
  ///   - fileData: Type to save
  ///   - file: Name and location where to save data as a json file
  private func SaveFile<T>(fileData: T, file: String) where T: Codable {
    
    let encoder = JSONEncoder()
    
    do {

      let jsonData = try encoder.encode(fileData)
      
      try jsonData.write(to: URL(fileURLWithPath: file))
      
    } catch {
      print(error)
    }
    
  }
  
  /// Ensures that the passed file exists
  /// - Parameter file: Path and file name for the input file
  private func fileExists(_ file: String) -> Bool {
    
    let fileManager = FileManager.default
    if !fileManager.fileExists(atPath: file) {

      print("\(file) NOT AVAILABLE")
      return false
    
    }
    
    return true
    
  }
  
}
