//
//  main.swift
//  MixTape
//
//  Created by Taylor Maxwell on 12/3/19.
//  Copyright © 2019 Taylor Maxwell. All rights reserved.
//

import Foundation

/// Startup
func main() {

  if CommandLine.arguments.count <= 3 {
    print("Missing input file and and change file")
  }

  let inputFile = CommandLine.arguments[1]
  let changeFile = CommandLine.arguments[2]
  let outputFile = CommandLine.arguments[3]
  
  let processor = Processor()
  
  // Use to generate a changes file (If needed)
  //processor.generateChangesFile(changeFile)
  
  processor.update(inputFile: inputFile, changeFile: changeFile, outputFile: outputFile)
  
  
}

main()
