//
//  ExperienceFollowStatuse.swift
//  Model Generated using keith model generator
//  Created on August 10, 2018

import Foundation


class ExperienceFollowStatuse : NSObject, NSCoding{

    var refId : AnyObject!
    var status : String!
    var userId : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        refId = dictionary["ref_id"] as? AnyObject
        status = dictionary["status"] as? String
        userId = dictionary["user_id"] as? Int
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if refId != nil{
            dictionary["ref_id"] = refId
        }
        if status != nil{
            dictionary["status"] = status
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        refId = aDecoder.decodeObject(forKey: "ref_id") as? AnyObject
        status = aDecoder.decodeObject(forKey: "status") as? String
        userId = aDecoder.decodeObject(forKey: "user_id") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if refId != nil{
            aCoder.encode(refId, forKey: "ref_id")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
    }
}
