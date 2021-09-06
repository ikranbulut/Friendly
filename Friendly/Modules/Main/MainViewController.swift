//
//  ViewController.swift
//  Friendly
//
//  Created by Mac on 2.09.2021.
//

import UIKit

class MainViewController: UIViewController {
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  private let viewModel = MainViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
  @IBAction func singInButtonTapped(_ sender: UIButton) {
    if viewModel.checkUserIsValid(viewModel.entryUsername) {
      let friendStoryboard = UIStoryboard(name: "FriendList", bundle: nil)
      
      let friendController = friendStoryboard.instantiateViewController(withIdentifier: "FriendList") as! FriendListViewController
      
      navigationController?.pushViewController(friendController, animated: true)
      
    } else {
      showError(title: "error", subtitle: "error")
    }
  }
}

extension MainViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    usernameTextField.endEditing(true)
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    viewModel.entryUsername = usernameTextField.text!
  }
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    if usernameTextField.text != "" {
      viewModel.entryUsername = usernameTextField.text!
      return true
    } else {
      usernameTextField.placeholder = "Enter your username"
      return false
    }
  }
}
