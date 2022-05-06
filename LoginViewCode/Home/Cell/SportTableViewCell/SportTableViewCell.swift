//
//  SportTableViewCell.swift
//  LoginViewCode
//
//  Created by Lillian Peixoto on 29/04/22.
//

import UIKit

class SportTableViewCell: UITableViewCell {
    
    var sportTableViewCellScreen: SportTableViewCellScreen = SportTableViewCellScreen()
    var data: [Sport] = []
    static let identifier: String = "SportTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubView()
        self.configConstraintsSportTableViewCellScreen()
        self.sportTableViewCellScreen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        self.contentView.addSubview(self.sportTableViewCellScreen)
    }

    func configConstraintsSportTableViewCellScreen() {
        self.sportTableViewCellScreen.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    public func dataCollection(data: [Sport]) {
        self.data = data
    }

}

extension SportTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: SportCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionViewCell.identifier, for: indexPath) as? SportCollectionViewCell
        cell?.setupCell(data: self.data[indexPath.row])
        
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 100)
    }
    
}
