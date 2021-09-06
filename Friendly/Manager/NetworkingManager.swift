//
//  NetworkingManager.swift
//  Friendly
//
//  Created by Mac on 2.09.2021.
//

import Foundation
import Alamofire

final class NetworkingManager {  
  func getFriends(_ resultCount: String, completionHandler: @escaping (Friends) -> ()) {
    let url = Constants.baseUrl + Constants.urlPath + Constants.queryParam + resultCount
    
    let request =  AF.request(url, method: .get)
    
    request.responseDecodable (of: Friends.self) { response in
      guard let friends = response.value else { return }
      
      completionHandler(friends)
    }
  }
}
