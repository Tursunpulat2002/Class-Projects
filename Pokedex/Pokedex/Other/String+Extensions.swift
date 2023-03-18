//
//  String+Extensions.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/18/23.
//

import Foundation

extension String{
    static func threeDigits(_ num: Int)-> String{
        return String(format: "%03d", num)
    }
}
