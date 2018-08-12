//
//  ExperienceData.swift
//  Model Generated using keith model generator
//  Created on August 10, 2018

import Foundation


class ExperienceData : NSObject, NSCoding{

    var comments : [ExperienceComment]!
    var experiences : [Experience]!
    var followStatuses : [ExperienceFollowStatuse]!
    var locations : [ExperienceLocation]!
    var pictures : [ExperiencePicture]!
    var users : [ExperienceUser]!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        comments = [ExperienceComment]()
        if let commentsArray = dictionary["comments"] as? [[String:Any]]{
            for dic in commentsArray{
                let value = ExperienceComment(fromDictionary: dic)
                comments.append(value)
            }
        }
        experiences = [Experience]()
        if let experiencesArray = dictionary["experiences"] as? [[String:Any]]{
            for dic in experiencesArray{
                let value = Experience(fromDictionary: dic)
                experiences.append(value)
            }
        }
        followStatuses = [ExperienceFollowStatuse]()
        if let followStatusesArray = dictionary["follow_statuses"] as? [[String:Any]]{
            for dic in followStatusesArray{
                let value = ExperienceFollowStatuse(fromDictionary: dic)
                followStatuses.append(value)
            }
        }
        locations = [ExperienceLocation]()
        if let locationsArray = dictionary["locations"] as? [[String:Any]]{
            for dic in locationsArray{
                let value = ExperienceLocation(fromDictionary: dic)
                locations.append(value)
            }
        }
        pictures = [ExperiencePicture]()
        if let picturesArray = dictionary["pictures"] as? [[String:Any]]{
            for dic in picturesArray{
                let value = ExperiencePicture(fromDictionary: dic)
                pictures.append(value)
            }
        }
        users = [ExperienceUser]()
        if let usersArray = dictionary["users"] as? [[String:Any]]{
            for dic in usersArray{
                let value = ExperienceUser(fromDictionary: dic)
                users.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if comments != nil{
            var dictionaryElements = [[String:Any]]()
            for commentsElement in comments {
                dictionaryElements.append(commentsElement.toDictionary())
            }
            dictionary["comments"] = dictionaryElements
        }
        if experiences != nil{
            var dictionaryElements = [[String:Any]]()
            for experiencesElement in experiences {
                dictionaryElements.append(experiencesElement.toDictionary())
            }
            dictionary["experiences"] = dictionaryElements
        }
        if followStatuses != nil{
            var dictionaryElements = [[String:Any]]()
            for followStatusesElement in followStatuses {
                dictionaryElements.append(followStatusesElement.toDictionary())
            }
            dictionary["followStatuses"] = dictionaryElements
        }
        if locations != nil{
            var dictionaryElements = [[String:Any]]()
            for locationsElement in locations {
                dictionaryElements.append(locationsElement.toDictionary())
            }
            dictionary["locations"] = dictionaryElements
        }
        if pictures != nil{
            var dictionaryElements = [[String:Any]]()
            for picturesElement in pictures {
                dictionaryElements.append(picturesElement.toDictionary())
            }
            dictionary["pictures"] = dictionaryElements
        }
        if users != nil{
            var dictionaryElements = [[String:Any]]()
            for usersElement in users {
                dictionaryElements.append(usersElement.toDictionary())
            }
            dictionary["users"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        comments = aDecoder.decodeObject(forKey: "comments") as? [ExperienceComment]
        experiences = aDecoder.decodeObject(forKey: "experiences") as? [Experience]
        followStatuses = aDecoder.decodeObject(forKey: "follow_statuses") as? [ExperienceFollowStatuse]
        locations = aDecoder.decodeObject(forKey: "locations") as? [ExperienceLocation]
        pictures = aDecoder.decodeObject(forKey: "pictures") as? [ExperiencePicture]
        users = aDecoder.decodeObject(forKey: "users") as? [ExperienceUser]
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if comments != nil{
            aCoder.encode(comments, forKey: "comments")
        }
        if experiences != nil{
            aCoder.encode(experiences, forKey: "experiences")
        }
        if followStatuses != nil{
            aCoder.encode(followStatuses, forKey: "follow_statuses")
        }
        if locations != nil{
            aCoder.encode(locations, forKey: "locations")
        }
        if pictures != nil{
            aCoder.encode(pictures, forKey: "pictures")
        }
        if users != nil{
            aCoder.encode(users, forKey: "users")
        }
    }
}
