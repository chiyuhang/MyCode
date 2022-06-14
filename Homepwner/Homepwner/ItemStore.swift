//
//  ItemStore.swift
//  Homepwner
//
//  Created by ByteDance on 2022/6/7.
//
import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    func createItem() -> Item {
        
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }

}
