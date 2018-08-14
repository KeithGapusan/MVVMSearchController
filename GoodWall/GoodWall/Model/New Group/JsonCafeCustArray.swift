//
//  JsonCafeCustArray.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 13, 2018

import Foundation


class JsonCafeCustArray : NSObject, NSCoding{

    var a : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        a = dictionary["a"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if a != nil{
            dictionary["a"] = a
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        a = aDecoder.decodeObject(forKey: "a") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if a != nil{
            aCoder.encode(a, forKey: "a")
        }
    }
}