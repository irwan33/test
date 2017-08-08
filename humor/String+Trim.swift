//
//  String+Trim.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/3/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit

extension String {
  var pairs: [String] {
    var result: [String] = []
    let characters = Array(self.characters)
    stride(from: 0, to: characters.count, by: 2).forEach {
      result.append(String(characters[$0..<min($0+2, characters.count)]))
    }
    return result
  }
  
  mutating func insert(separator: String, every n: Int) {
    self = inserting(separator: separator, every: n)
  }
  
  func inserting(separator: String, every n: Int) -> String {
    var result: String = ""
    let characters = Array(self.characters)
    stride(from: 0, to: characters.count, by: n).forEach {
      result += String(characters[$0..<min($0+n, characters.count)])
      if $0+n < characters.count {
        result += separator
      }
    }
    return result
  }
  
  func replace(string:String, replacement:String) -> String {
    return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
  }
  
  func removeWhitespace() -> String {
    return self.replace(string: " ", replacement: "")
  }
  
  func reCreateWhitespace() -> String {
    return self.replace(string: "#", replacement: " #")
  }
  
  var containsValidCharacter: Bool {
    let characterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890_")
    let range = (self as NSString).rangeOfCharacter(from: characterSet)
    return range.location != NSNotFound
  }
}

