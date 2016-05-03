//
//  DataType.swift
//  Konomi
//
//  Created by tanaka.kenji on 2016/04/05.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Foundation

protocol DataType {
    associatedtype ItemType
    
    var numberOfItems: Int { get }
    
    subscript(index: Int) -> ItemType { get }
    
    func insertItemAtIndex(item: ItemType, index: Int) -> Self
    func deleteItemAtIndex(index: Int) -> Self
}