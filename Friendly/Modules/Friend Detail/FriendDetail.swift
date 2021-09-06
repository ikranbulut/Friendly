//
//  FriendDetailView.swift
//  Friendly
//`
//  Created by Mac on 2.09.2021.
//

import UIKit
import SnapKit
import CoreLocation
import MapKit

final class FriendDetail: UIView {
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var fullnameLabel: UILabel!
  @IBOutlet weak var genderLabel: UILabel!
  @IBOutlet weak var countryLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var ageLabel: UILabel!
  @IBOutlet weak var cellLabel: UILabel!

  var close: (() -> Void)?
  
  var latitude = ""
  var longitude = ""
  var friendsFulllname = ""
  
  private override init(frame: CGRect) {
    super.init(frame: frame)
    
    loadNib()
  }
  
  internal required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    loadNib()
  }
  
  private func loadNib() {
    Bundle.main.loadNibNamed("FriendDetail", owner: self, options: nil)
    
    addSubview(contentView)
    
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    contentView.layer.masksToBounds = true
  }
  
  func FriendDetailViewConstraint() {
    snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.right.equalToSuperview()
      make.left.equalToSuperview()
      make.bottom.equalToSuperview()
    }
  }
  
  func createAnnotaion() {
    let friendLocation = MKPointAnnotation()

    friendLocation.title = friendsFulllname
    friendLocation.coordinate = CLLocationCoordinate2D(latitude: (latitude as NSString).doubleValue , longitude: (longitude as NSString).doubleValue)
    mapView.addAnnotation(friendLocation)
  }
  
  func configure(_ fullname: String, _ image: String, _ gender: Gender , _ country: String, _ email: String, _ age: String, _ cell: String, _ latitude: String, _ longitude: String) {
    fullnameLabel.text = Localization.Friend.fullname + fullname
    genderLabel.text = Localization.Friend.gender + gender.rawValue
    countryLabel.text = Localization.Friend.country + country
    emailLabel.text = Localization.Friend.email + email
    ageLabel.text = Localization.Friend.age + age
    cellLabel.text = Localization.Friend.phoneNumber + cell
    
    self.latitude = latitude
    self.longitude = longitude
    self.friendsFulllname = fullname
    
    createAnnotaion()
  }
  
  @IBAction func closeButtonTapped(_ sender: UIButton) {
    close?()
  }
}
