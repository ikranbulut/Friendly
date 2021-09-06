//
//  Constants.swift
//  Friendly
//
//  Created by Mac on 2.09.2021.
//

import Foundation

final class Constants {
  static var baseUrl: String {
    get {
      guard let filePath = Bundle.main.path(forResource: "Friends", ofType: "plist") else {
        fatalError("Couldn't find file 'Friends.plist'.")
      }
      
      let plist = NSDictionary(contentsOfFile: filePath)
      
      guard let value = plist?.object(forKey: "baseUrl") as? String else {
        fatalError("Couldn't find key 'Base URL' in 'Friends.plist'.")
      }
      
      return value
    }
  }
  
 static var urlPath: String {
    get {
      guard let filePath = Bundle.main.path(forResource: "Friends", ofType: "plist") else {
        fatalError("Couldn't find file 'Friends.plist'.")
      }
      
      let plist = NSDictionary(contentsOfFile: filePath)
      
      guard let value = plist?.object(forKey: "urlPath") as? String else {
        fatalError("Couldn't find key 'Url Path' in 'Friends.plist'.")
      }
      
      return value
    }
  }
  
  static var queryParam: String {
     get {
       guard let filePath = Bundle.main.path(forResource: "Friends", ofType: "plist") else {
         fatalError("Couldn't find file 'Friends.plist'.")
       }
      
       let plist = NSDictionary(contentsOfFile: filePath)
      
       guard let value = plist?.object(forKey: "queryParam") as? String else {
         fatalError("Couldn't find key 'Query Param' in 'Friends.plist'.")
       }
      
       return value
     }
   }
}
