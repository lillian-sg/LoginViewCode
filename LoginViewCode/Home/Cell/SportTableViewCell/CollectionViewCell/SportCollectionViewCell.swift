//
//  SportCollectionViewCell.swift
//  LoginViewCode
//
//  Created by Lillian Peixoto on 02/05/22.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "SportCollectionViewCell"
    
    let sportCollectionViewCellScreen: SportCollectionViewCellScreen = SportCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.configConstraints()
    }
    
    public func setupCell(data: Sport) {
        self.sportCollectionViewCellScreen.imageView.image = UIImage(named: data.nameImage)
        self.sportCollectionViewCellScreen.sportName.text = data.name
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        self.sportCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.sportCollectionViewCellScreen)
    }
    func configConstraints() {
        NSLayoutConstraint.activate([
            self.sportCollectionViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.sportCollectionViewCellScreen.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.sportCollectionViewCellScreen.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.sportCollectionViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
            
        ])
        
    }
    
}
