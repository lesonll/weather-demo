//
//  MyResponse.swift
//  ExWeather
//
//  Created by MAC on 8/7/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import ObjectMapper

public class MyResponse: Mappable, Codable {
    var request: MyRequest?
    var loca: MyLoca?
    var curr: MyCurr?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        request <- map["request"]
        loca <- map["location"]
        curr <- map["current"]
    }
}

public class MyRequest: Mappable, Codable {
    
    var type: String?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        type <- map["type"]
        
    }
}

public class MyLoca: Mappable, Codable {
    
    var name: String?
    var coun: String?
    var time: String?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        name <- map["name"]
        coun <- map["country"]
        time <- map["localtime"]
        
    }
}

public class MyCurr: Mappable, Codable {
    
    var temp: Int?
    var icon: [String]?
    var desc: [String]?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        
        temp <- map["temperature"]
        icon <- map["weather_icons"]
        desc <- map["weather_descriptions"]
        
    }
    
    func geticon() -> [String] {
        return icon ?? [String]()
    }
    
    func getclao() -> [String] {
        return desc ?? [String]()
    }
}

public class District{
    var name: String = ""
    
    var value: [String: Any]?
    
    
    init(name: String, value: [String: Any]?) {
        self.name = name
        self.value = value
    }
}


