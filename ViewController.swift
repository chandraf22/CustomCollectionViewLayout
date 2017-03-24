//
//  ViewController.swift
//  CustomCollectionViewLayout
//
//  Created by Chandrachudh on 24/03/17.
//  Copyright © 2017 F22Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let pokemons = [#imageLiteral(resourceName: "articuno"),#imageLiteral(resourceName: "bulbasaur"),#imageLiteral(resourceName: "caterpie"),#imageLiteral(resourceName: "chansey"),#imageLiteral(resourceName: "charizard"),#imageLiteral(resourceName: "charmeleon"),#imageLiteral(resourceName: "charmander"),#imageLiteral(resourceName: "chiquerita"),#imageLiteral(resourceName: "cyndaquil"),#imageLiteral(resourceName: "eeve"),#imageLiteral(resourceName: "entie"),#imageLiteral(resourceName: "fireApe"),#imageLiteral(resourceName: "flareon"),#imageLiteral(resourceName: "froaugie"),#imageLiteral(resourceName: "ivysaur"),#imageLiteral(resourceName: "lugia"),#imageLiteral(resourceName: "magikarp"),#imageLiteral(resourceName: "maril"),#imageLiteral(resourceName: "mew"),#imageLiteral(resourceName: "oh-oh"),#imageLiteral(resourceName: "Pikachu"),#imageLiteral(resourceName: "sandshrew"),#imageLiteral(resourceName: "snorlax"),#imageLiteral(resourceName: "Squirtle"),#imageLiteral(resourceName: "togepie"),#imageLiteral(resourceName: "totodile"),#imageLiteral(resourceName: "unknown"),#imageLiteral(resourceName: "vaporeon"),#imageLiteral(resourceName: "zapdos")]
    
    
//    var isRandom = false
//    let columns:CGFloat =  3
//    let inset:CGFloat =  10.0
//    let spacing:CGFloat =  10.0
//    let linespacing:CGFloat =  10.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.isNavigationBarHidden = true
        
//        let flowLayout = UICollectionViewFlowLayout.init()
//        flowLayout.itemSize = CGSize(width: 200, height: 300)
//        flowLayout.minimumInteritemSpacing = 10
//        flowLayout.minimumLineSpacing = 10
//        flowLayout.scrollDirection = .vertical
//        collectionView.setCollectionViewLayout(flowLayout, animated: true)
        
        //Create custom flow layout
//        let flowLayout = MyFlowLayout()
//        flowLayout.itemSize = CGSize(width: 200, height: 300)
//        flowLayout.scrollDirection = .vertical
//        flowLayout.minimumInteritemSpacing = 10
//        flowLayout.minimumLineSpacing = -100
//        collectionView.setCollectionViewLayout(flowLayout, animated: true)
        
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.reuseIdentifier())
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Refresh Control
//        let refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self, action: #selector(refreshCollectionView), for: .valueChanged)
//        collectionView.refreshControl = refreshControl
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func refreshCollectionView() {
//        isRandom = true
//        collectionView.reloadData()
//        collectionView.refreshControl?.endRefreshing()
//    }
    
    //MARK:UICollectionview Protocol Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:MainCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.reuseIdentifier(), for: indexPath) as! MainCollectionViewCell
        cell.imgPokemon.image = pokemons[indexPath.row]
        return cell
    }
    
    
    //MARK:UICollectionViewDelegateFlowLayout protocol
//    /*Asks the delegate for the size of the specified item’s cell.*/
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
//        let width = Int((collectionView.frame.width/columns) - (inset+spacing))
//
//        var itemSize:Int = width
//
//        if isRandom == true {
//            itemSize = 64*Int(arc4random_uniform(UInt32(4))+1)
//        }
//
//        return CGSize(width: itemSize, height: itemSize)
//    }
//
//    /*Asks the delegate for the margins to apply to content in the specified section.*/
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
//    }
//    
//    /*Asks the delegate for the spacing between successive rows or columns of a section.*/
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return spacing
//    }
//    
//    /*Asks the delegate for the spacing between successive items in the rows or columns of a section.*/
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return linespacing
//    }
}

