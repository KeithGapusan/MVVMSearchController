//
//  JsonCafeRootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 13, 2018

import Foundation


class JsonCafeRootClass : NSObject, NSCoding{

    var array : [Int]!
    var booleanField : Bool!
    var custArray : [JsonCafeCustArray]!
    var nullField : AnyObject!
    var number : Int!
    var object : JsonCafeObject!
    var string : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        booleanField = dictionary["Boolean"] as? Bool
        nullField = dictionary["Null"] as? AnyObject
        number = dictionary["Number"] as? Int
        string = dictionary["String"] as? String
        if let objectData = dictionary["Object"] as? [String:Any]{
            object = JsonCafeObject(fromDictionary: objectData)
        }
        custArray = [JsonCafeCustArray]()
        if let custArrayArray = dictionary["CustArray"] as? [[String:Any]]{
            for dic in custArrayArray{
                let value = JsonCafeCustArray(fromDictionary: dic)
                custArray.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if booleanField != nil{
            dictionary["Boolean"] = booleanField
        }
        if nullField != nil{
            dictionary["Null"] = nullField
        }
        if number != nil{
            dictionary["Number"] = number
        }
        if string != nil{
            dictionary["String"] = string
        }
        if object != nil{
            dictionary["object"] = object.toDictionary()
        }
        if custArray != nil{
            var dictionaryElements = [[String:Any]]()
            for custArrayElement in custArray {
                dictionaryElements.append(custArrayElement.toDictionary())
            }
            dictionary["custArray"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        array = aDecoder.decodeObject(forKey: "Array") as? [Int]
        booleanField = aDecoder.decodeObject(forKey: "Boolean") as? Bool
        custArray = aDecoder.decodeObject(forKey: "CustArray") as? [JsonCafeCustArray]
        nullField = aDecoder.decodeObject(forKey: "Null") as? AnyObject
        number = aDecoder.decodeObject(forKey: "Number") as? Int
        object = aDecoder.decodeObject(forKey: "Object") as? JsonCafeObject
        string = aDecoder.decodeObject(forKey: "String") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if array != nil{
            aCoder.encode(array, forKey: "Array")
        }
        if booleanField != nil{
            aCoder.encode(booleanField, forKey: "Boolean")
        }
        if custArray != nil{
            aCoder.encode(custArray, forKey: "CustArray")
        }
        if nullField != nil{
            aCoder.encode(nullField, forKey: "Null")
        }
        if number != nil{
            aCoder.encode(number, forKey: "Number")
        }
        if object != nil{
            aCoder.encode(object, forKey: "Object")
        }
        if string != nil{
            aCoder.encode(string, forKey: "String")
        }
    }
}