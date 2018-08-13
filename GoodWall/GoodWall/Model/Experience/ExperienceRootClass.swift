//
//  ExperienceRootClass.swift
//  Model Generated using keith model generator
//  Created on August 10, 2018

import Foundation


class ExperienceRootClass : NSObject, NSCoding{

    var errorCode : AnyObject!
    var payload : ExperiencePayload!
    var statusCode : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        errorCode = dictionary["error_code"] as? AnyObject
        statusCode = dictionary["status_code"] as? Int
        if let payloadData = dictionary["payload"] as? [String:Any]{
            payload = ExperiencePayload(fromDictionary: payloadData)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if errorCode != nil{
            dictionary["error_code"] = errorCode
        }
        if statusCode != nil{
            dictionary["status_code"] = statusCode
        }
        if payload != nil{
            dictionary["payload"] = payload.toDictionary()
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        errorCode = aDecoder.decodeObject(forKey: "error_code") as? AnyObject
        payload = aDecoder.decodeObject(forKey: "payload") as? ExperiencePayload
        statusCode = aDecoder.decodeObject(forKey: "status_code") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if errorCode != nil{
            aCoder.encode(errorCode, forKey: "error_code")
        }
        if payload != nil{
            aCoder.encode(payload, forKey: "payload")
        }
        if statusCode != nil{
            aCoder.encode(statusCode, forKey: "status_code")
        }
    }
}
