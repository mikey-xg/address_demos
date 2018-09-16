//
//  titleM.swift
//  jiexiDemo
//
//  Created by 苏文潇 on 2018/9/12.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit
import ObjectMapper

class titleM: Mappable {
    
    var cars: [carM]?
    var title: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        cars <- map["cars"]
        title <- map["title"]
    }
}
