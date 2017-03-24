//
//  MainCollectionViewCell.swift
//  MeetupCollectionviewFlowLayout1
//
//  Created by Chandrachudh on 24/03/17.
//  Copyright © 2017 F22Labs. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    let imgPokemon:UIImageView = UIImageView.init()
    
    class func reuseIdentifier()->String {
        return "MainCollectionViewCell"
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.createViews()
    }
    
    convenience init(){
        self.init(frame:.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViews() {
        
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.rgb(fromHex: 0xbdc3c7).cgColor
        self.layer.borderWidth = 5.0
        
        self.backgroundColor = .white
        
        self.imgPokemon.contentMode = .scaleAspectFit
        self.addSubview(self.imgPokemon)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imgPokemon.frame = self.bounds
    }
    
}
