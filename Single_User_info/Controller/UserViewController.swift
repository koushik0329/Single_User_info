//
//  UserViewController.swift
//  Single_User_info
//
//  Created by Koushik Reddy Kambham on 9/12/25.
//
 
import UIKit
 
class UserViewController: UIViewController {
    
    var nameLabel: UILabel!
    var genderLabel: UILabel!
    
    var userViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        userViewModel.getDataFromServer {
            self.nameLabel.text = self.userViewModel.user?.name ?? "No Name"
            self.genderLabel.text = self.userViewModel.user?.gender ?? "No Gender"
        }
        
    }
    
    func setupUI() {
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        genderLabel = UILabel()
        genderLabel.font = .systemFont(ofSize: 17)
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(genderLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            genderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            genderLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
    }
}
 
