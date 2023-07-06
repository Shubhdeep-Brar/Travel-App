//
//  FriendsViewController.swift
//  Travel App
//
//  Created by Shubhdeep on 2023-02-28.
//
import Foundation
import UIKit

class FriendsViewController: UIViewController {
   
    let data = DataProvider.makeMockData()
    
    lazy var friendsTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(FriendCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        
        
        return tableView
    }()
    override func viewDidLoad(){
        title = "Friends"
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(friendsTableView)
        NSLayoutConstraint.activate([
            friendsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            friendsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            friendsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            friendsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionData = data[section]
        return sectionData.1.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! FriendCell
        
        let cellData = data[indexPath.section].1[indexPath.row]
        cell.updateView(nickName: cellData.nickName,
                        age: cellData.age,
                        location: cellData.location,
                        image: cellData.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let headerTitle = data[section].0
        return headerTitle
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell at \(indexPath.section) section and \(indexPath.row) row is selected")
        
        let cellData = data[indexPath.section].1[indexPath.row]
        
        let alertViewController = UIAlertController(
            title: cellData.nickName, message: "You selected this person", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Close", style: .cancel)
        
        self.navigationController?.present(alertViewController, animated: true)
        
        alertViewController.addAction(action)
    }
}
