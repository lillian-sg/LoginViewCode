//
//  UserDetailTableViewCell.swift
//  LoginViewCode
//
//  Created by Lillian Peixoto on 28/04/22.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {

    static let identifier: String = "UserDetailTableViewCell"
    
    lazy var userDetailView: UserDetailView = {
        let view = UserDetailView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview()
        self.configConstraintsUserDetailView()
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        self.contentView.addSubview(self.userDetailView)
    }
    
    public func setupCell(data: DataUser) {
        self.userDetailView.userImageView.image = UIImage(named: data.nameImage)
        self.userDetailView.nameLabel.text = data.name

    }
    
    private func configConstraintsUserDetailView(){
        self.userDetailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    

}
