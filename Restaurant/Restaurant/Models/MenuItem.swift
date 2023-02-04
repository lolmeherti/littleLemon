//
//  MenuItem.swift
//  Restaurant
//
//  Created by Alex H. on 04.02.23.
//

import Foundation

struct MenuItem: Decodable
{
    let title:String
    let image:String
    let price:String
    let description:String
    let category:String
}
