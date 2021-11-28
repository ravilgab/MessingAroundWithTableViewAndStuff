//
//  CafeModel.swift
//  MessingWithTableView
//
//  Created by Ravil on 28.11.2021.
//

import UIKit

struct Cafe {
    
    var name: String
    var location: String?
    var type: String?
    var image: UIImage?
    var cafeImage: String?
    
    static let cafeNames = [
        "Burger Heroes", "McDonalds", "ФАРШ", "Марукамэ",
        "Шаурму х@чу!", "Burger King", "KFC", "Суши Вок",
        "Моремания", "Якитория", "Тануки", "Шефбургер"
    ]
    
    static func getCafes() -> [Cafe] {
        var cafes = [Cafe]()
        
        for cafe in cafeNames {
            cafes.append(Cafe(name: cafe, location: "Москва", type: "Кафе", image: nil, cafeImage: cafe))
        }
        
        return cafes
    }
}
