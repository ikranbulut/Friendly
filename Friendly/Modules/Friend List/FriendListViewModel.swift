//
//  FriendsListViewModel.swift
//  Friendly
//
//  Created by Mac on 2.09.2021.
//

import Foundation

final class FriendLisViewModel {
  private let networkingManager = NetworkingManager()
  
  var friends: [Result] = []
  private var resultCount = 10
  
  func getFriends(completionHandler: @escaping (Bool) -> ()) {
    return networkingManager.getFriends(resultCount.description, completionHandler: { [weak self] friends in
      guard let self = self else { return }
      
      self.friends = friends.results

      completionHandler(true)
    })
  }
  
  func getRowCount() -> Int {
    return friends.count  }
  
  func getFriend(at index: Int) -> Result {
    return friends[index]
  }
}
