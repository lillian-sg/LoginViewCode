//
//  HomeViewController.swift
//  LoginViewCode
//
//  Created by Lillian Peixoto on 27/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeScreen: HomeScreen?
    var dataUser: [DataUser] = [DataUser(name: "Theo", nameImage: "menino1"),
                            DataUser(name: "Lillian", nameImage: "menina1"),
                            DataUser(name: "Beatriz", nameImage: "menina2")
                            ]
    
    var dataSport: [Sport] = [Sport(name: "Corrida", nameImage: "running"),
                              Sport(name: "Ciclismo", nameImage: "cycling"),
                              Sport(name: "Yoga", nameImage: "running"),
                              Sport(name: "Natação", nameImage: "running"),
                              Sport(name: "Dança", nameImage: "running"),
    ]
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    

   

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataUser.count + 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3{
            let cell: SportTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
            cell?.dataCollection(data: self.dataSport)
            return cell ?? UITableViewCell()
        }
        
        let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        
        cell?.setupCell(data: self.dataUser[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
