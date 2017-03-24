//
//  MyFlowLayout.swift
//  Carouseltrial2
//
//  Created by Chandrachudh on 24/03/17.
//  Copyright © 2017 F22Labs. All rights reserved.
//

import UIKit

class MyFlowLayout: UICollectionViewFlowLayout {
    
    let standardItemAlpha:CGFloat  = 0.5
    let standardItemScale:CGFloat = 0.5
    
    var isSetup = false
    
    var maxRatio:CGFloat = 0
    
    var i:Int = 0
    
    override func prepare() {
        super.prepare()
        
        if isSetup == false {
            setupCollectionView()
            isSetup = true
        }
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    func changeAttributes(attributes:UICollectionViewLayoutAttributes) {
        
        let collectionCenter = (collectionView?.frame.size.height)!/2
        let offset = collectionView?.contentOffset.y
        let normalizedcenter = attributes.center.y - offset!
        
        let maxDistance = self.itemSize.height + self.minimumLineSpacing
        let distance = min(abs(collectionCenter - normalizedcenter), maxDistance)
        
        let ratio = (maxDistance - distance)/maxDistance
        let alpha = ratio * (1-standardItemAlpha) + standardItemAlpha
        let scale = ratio * (1-standardItemScale) + standardItemScale
        
        attributes.alpha = alpha
        attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
        
        maxRatio = max(maxRatio, ratio)
        if maxRatio == ratio {
            attributes.zIndex = 1
        }
        else {
            attributes.zIndex = 0
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributes = super.layoutAttributesForElements(in: rect)
        
        var attributesCopy = [UICollectionViewLayoutAttributes]()
        
        for itemAttributes in attributes! {
            let itemAttributesCopy = itemAttributes.copy() as! UICollectionViewLayoutAttributes
            
            changeAttributes(attributes: itemAttributesCopy)
            attributesCopy.append(itemAttributesCopy)
        }
        
        return attributesCopy
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let layoutAttributes = self.layoutAttributesForElements(in: (collectionView?.bounds)!)
        
        let center = (collectionView?.bounds.size.height)!/2
        let proposedContentOffsetCenterOrigin = proposedContentOffset.y + center
        
        let closest = layoutAttributes?.sorted { abs($0.center.y - proposedContentOffsetCenterOrigin) < abs($1.center.y - proposedContentOffsetCenterOrigin)}.first ?? UICollectionViewLayoutAttributes()
        
        let targetContentOffset = CGPoint(x: proposedContentOffset.x, y: floor(closest.center.y - center))
        
        return targetContentOffset
        
    }
    
    func setupCollectionView() {
        self.collectionView?.decelerationRate = UIScrollViewDecelerationRateFast
        
        let collectionSize = collectionView?.bounds.size
        let yInset = ((collectionSize?.height)! - self.itemSize.height)/2
        let xInset = ((collectionSize?.width)! - self.itemSize.width)/2
        
        self.sectionInset = UIEdgeInsetsMake(yInset, xInset, yInset, xInset)
    }
}
