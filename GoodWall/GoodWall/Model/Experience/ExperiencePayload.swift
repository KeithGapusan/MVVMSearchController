//
//  ExperiencePayload.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 10, 2018

import Foundation


class ExperiencePayload : NSObject, NSCoding{

    var count : Int!
    var data : ExperienceData!
    var results : [Int]!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        count = dictionary["count"] as? Int
        if let dataData = dictionary["data"] as? [String:Any]{
            data = ExperienceData(fromDictionary: dataData)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if count != nil{
            dictionary["count"] = count
        }
        if data != nil{
            dictionary["data"] = data.toDictionary()
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        count = aDecoder.decodeObject(forKey: "count") as? Int
        data = aDecoder.decodeObject(forKey: "data") as? ExperienceData
        results = aDecoder.decodeObject(forKey: "results") as? [Int]
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if count != nil{
            aCoder.encode(count, forKey: "count")
        }
        if data != nil{
            aCoder.encode(data, forKey: "data")
        }
        if results != nil{
            aCoder.encode(results, forKey: "results")
        }
    }
}