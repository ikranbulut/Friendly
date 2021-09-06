//
//  FriendListViewController.swift
//  Friendly
//
//  Created by Mac on 2.09.2021.
//

import UIKit

final class FriendListViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var detailView: FriendDetail!
  
  private var viewModel = FriendLisViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.getFriends { [weak self] isRequestSucces in
      guard let self = self else { return }
      
      isRequestSucces ? self.tableView.reloadData() : self.showError(title: "Error", subtitle: "Error subtitle")
    }
  }
  
  private func configurePhotoDetailView(_ isDetailViewHidden: Bool, _ isTableViewHidden: Bool) {
    detailView.isHidden = isDetailViewHidden
    tableView.isHidden = isTableViewHidden
  }
}

extension FriendListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.getRowCount()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = indexPath.row
    
    let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.friend, for: indexPath) as! FriendListCustomCell
    
    let friend = viewModel.getFriend(at: row)
    
    cell.configure(friend.fullName, friend.picture.medium)
    
    return cell
  }
}

extension FriendListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let row = indexPath.row
  
    configurePhotoDetailView(false, true)
    
    let selectedFriend = viewModel.getFriend(at: row)
    
    detailView.configure(selectedFriend.fullName, selectedFriend.picture.medium, selectedFriend.gender, selectedFriend.location.country, selectedFriend.email, selectedFriend.dob.age.description, selectedFriend.cell, selectedFriend.location.coordinates.latitude, selectedFriend.location.coordinates.longitude)

    detailView.close = { [weak self] in
      guard let self = self else { return }
      
      self.configurePhotoDetailView(true, false)
    }
  }
}
