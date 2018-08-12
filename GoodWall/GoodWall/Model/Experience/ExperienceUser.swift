//
//  ExperienceUser.swift
//  Model Generated using keith model generator
//  Created on August 10, 2018

import Foundation


class ExperienceUser : NSObject, NSCoding{

    var displayName : String!
    var id : Int!
    var level : Int!
    var pictureId : Int!
    var slug : String!
    var type : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        displayName = dictionary["display_name"] as? String
        id = dictionary["id"] as? Int
        level = dictionary["level"] as? Int
        pictureId = dictionary["picture_id"] as? Int
        slug = dictionary["slug"] as? String
        type = dictionary["type"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if displayName != nil{
            dictionary["display_name"] = displayName
        }
        if id != nil{
            dictionary["id"] = id
        }
        if level != nil{
            dictionary["level"] = level
        }
        if pictureId != nil{
            dictionary["picture_id"] = pictureId
        }
        if slug != nil{
            dictionary["slug"] = slug
        }
        if type != nil{
            dictionary["type"] = type
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        displayName = aDecoder.decodeObject(forKey: "display_name") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        level = aDecoder.decodeObject(forKey: "level") as? Int
        pictureId = aDecoder.decodeObject(forKey: "picture_id") as? Int
        slug = aDecoder.decodeObject(forKey: "slug") as? String
        type = aDecoder.decodeObject(forKey: "type") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if displayName != nil{
            aCoder.encode(displayName, forKey: "display_name")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if level != nil{
            aCoder.encode(level, forKey: "level")
        }
        if pictureId != nil{
            aCoder.encode(pictureId, forKey: "picture_id")
        }
        if slug != nil{
            aCoder.encode(slug, forKey: "slug")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
    }
}
