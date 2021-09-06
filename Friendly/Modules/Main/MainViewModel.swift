//
//  MainViewModel.swift
//  Friendly
//
//  Created by Mac on 2.09.2021.
//

import Foundation

final class MainViewModel {
  var users = [User.user1, User.user2, User.user3, User.user4, User.user5]
  var entryUsername = ""
  
  func checkUserIsValid(_ username: String) -> Bool {
    return users.contains(username)
  }
}
