//
//  carM.swift
//  jiexiDemo
//
//  Created by 苏文潇 on 2018/9/12.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit
import ObjectMapper

class carM: Mappable {
    
    var icon: String?
    var name: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        icon <- map["icon"]
        name <- map["name"]
    }
}
