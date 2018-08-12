//
//  ExperienceComment.swift
//  Model Generated using keith model generator/ 
//  Created on August 10, 2018

import Foundation


class ExperienceComment : NSObject, NSCoding{

    var authorId : Int!
    var body : String!
    var created : String!
    var id : Int!
    var modified : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        authorId = dictionary["author_id"] as? Int
        body = dictionary["body"] as? String
        created = dictionary["created"] as? String
        id = dictionary["id"] as? Int
        modified = dictionary["modified"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if authorId != nil{
            dictionary["author_id"] = authorId
        }
        if body != nil{
            dictionary["body"] = body
        }
        if created != nil{
            dictionary["created"] = created
        }
        if id != nil{
            dictionary["id"] = id
        }
        if modified != nil{
            dictionary["modified"] = modified
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        authorId = aDecoder.decodeObject(forKey: "author_id") as? Int
        body = aDecoder.decodeObject(forKey: "body") as? String
        created = aDecoder.decodeObject(forKey: "created") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        modified = aDecoder.decodeObject(forKey: "modified") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if authorId != nil{
            aCoder.encode(authorId, forKey: "author_id")
        }
        if body != nil{
            aCoder.encode(body, forKey: "body")
        }
        if created != nil{
            aCoder.encode(created, forKey: "created")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if modified != nil{
            aCoder.encode(modified, forKey: "modified")
        }
    }
}
