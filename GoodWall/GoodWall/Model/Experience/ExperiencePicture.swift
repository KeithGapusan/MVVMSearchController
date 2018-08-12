//
//  ExperiencePicture.swift
//  Model Generated using keith model generator
//  Created on August 10, 2018

import Foundation


class ExperiencePicture : NSObject, NSCoding{

    var id : Int!
    var name : String!
    var sortOrder : Int!
    var use : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        sortOrder = dictionary["sort_order"] as? Int
        use = dictionary["use"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if sortOrder != nil{
            dictionary["sort_order"] = sortOrder
        }
        if use != nil{
            dictionary["use"] = use
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        id = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        sortOrder = aDecoder.decodeObject(forKey: "sort_order") as? Int
        use = aDecoder.decodeObject(forKey: "use") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if sortOrder != nil{
            aCoder.encode(sortOrder, forKey: "sort_order")
        }
        if use != nil{
            aCoder.encode(use, forKey: "use")
        }
    }
}
