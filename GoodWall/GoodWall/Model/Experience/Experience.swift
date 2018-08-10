//
//  Experience.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 10, 2018

import Foundation


class Experience : NSObject, NSCoding{

    var authorId : Int!
    var body : String!
    var commentCount : Int!
    var comments : [Int]!
    var created : String!
    var endDate : String!
    var experienceOrder : Int!
    var hasLiked : Bool!
    var hashtagCount : Int!
    var hashtags : [AnyObject]!
    var id : Int!
    var isFull : Bool!
    var isPromoted : Bool!
    var likeCount : Int!
    var locationId : Int!
    var modified : String!
    var pictures : [Int]!
    var skillCount : Int!
    var skills : [String]!
    var slug : String!
    var startDate : String!
    var taggedUserCount : Int!
    var timelineDate : String!
    var title : String!
    var video : AnyObject!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        authorId = dictionary["author_id"] as? Int
        body = dictionary["body"] as? String
        commentCount = dictionary["comment_count"] as? Int
        created = dictionary["created"] as? String
        endDate = dictionary["end_date"] as? String
        experienceOrder = dictionary["experience_order"] as? Int
        hasLiked = dictionary["has_liked"] as? Bool
        hashtagCount = dictionary["hashtag_count"] as? Int
        id = dictionary["id"] as? Int
        isFull = dictionary["is_full"] as? Bool
        isPromoted = dictionary["is_promoted"] as? Bool
        likeCount = dictionary["like_count"] as? Int
        locationId = dictionary["location_id"] as? Int
        modified = dictionary["modified"] as? String
        skillCount = dictionary["skill_count"] as? Int
        slug = dictionary["slug"] as? String
        startDate = dictionary["start_date"] as? String
        taggedUserCount = dictionary["tagged_user_count"] as? Int
        timelineDate = dictionary["timeline_date"] as? String
        title = dictionary["title"] as? String
        video = dictionary["video"] as? AnyObject
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
        if commentCount != nil{
            dictionary["comment_count"] = commentCount
        }
        if created != nil{
            dictionary["created"] = created
        }
        if endDate != nil{
            dictionary["end_date"] = endDate
        }
        if experienceOrder != nil{
            dictionary["experience_order"] = experienceOrder
        }
        if hasLiked != nil{
            dictionary["has_liked"] = hasLiked
        }
        if hashtagCount != nil{
            dictionary["hashtag_count"] = hashtagCount
        }
        if id != nil{
            dictionary["id"] = id
        }
        if isFull != nil{
            dictionary["is_full"] = isFull
        }
        if isPromoted != nil{
            dictionary["is_promoted"] = isPromoted
        }
        if likeCount != nil{
            dictionary["like_count"] = likeCount
        }
        if locationId != nil{
            dictionary["location_id"] = locationId
        }
        if modified != nil{
            dictionary["modified"] = modified
        }
        if skillCount != nil{
            dictionary["skill_count"] = skillCount
        }
        if slug != nil{
            dictionary["slug"] = slug
        }
        if startDate != nil{
            dictionary["start_date"] = startDate
        }
        if taggedUserCount != nil{
            dictionary["tagged_user_count"] = taggedUserCount
        }
        if timelineDate != nil{
            dictionary["timeline_date"] = timelineDate
        }
        if title != nil{
            dictionary["title"] = title
        }
        if video != nil{
            dictionary["video"] = video
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
        commentCount = aDecoder.decodeObject(forKey: "comment_count") as? Int
        comments = aDecoder.decodeObject(forKey: "comments") as? [Int]
        created = aDecoder.decodeObject(forKey: "created") as? String
        endDate = aDecoder.decodeObject(forKey: "end_date") as? String
        experienceOrder = aDecoder.decodeObject(forKey: "experience_order") as? Int
        hasLiked = aDecoder.decodeObject(forKey: "has_liked") as? Bool
        hashtagCount = aDecoder.decodeObject(forKey: "hashtag_count") as? Int
        hashtags = aDecoder.decodeObject(forKey: "hashtags") as? [AnyObject]
        id = aDecoder.decodeObject(forKey: "id") as? Int
        isFull = aDecoder.decodeObject(forKey: "is_full") as? Bool
        isPromoted = aDecoder.decodeObject(forKey: "is_promoted") as? Bool
        likeCount = aDecoder.decodeObject(forKey: "like_count") as? Int
        locationId = aDecoder.decodeObject(forKey: "location_id") as? Int
        modified = aDecoder.decodeObject(forKey: "modified") as? String
        pictures = aDecoder.decodeObject(forKey: "pictures") as? [Int]
        skillCount = aDecoder.decodeObject(forKey: "skill_count") as? Int
        skills = aDecoder.decodeObject(forKey: "skills") as? [String]
        slug = aDecoder.decodeObject(forKey: "slug") as? String
        startDate = aDecoder.decodeObject(forKey: "start_date") as? String
        taggedUserCount = aDecoder.decodeObject(forKey: "tagged_user_count") as? Int
        timelineDate = aDecoder.decodeObject(forKey: "timeline_date") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
        video = aDecoder.decodeObject(forKey: "video") as? AnyObject
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
        if commentCount != nil{
            aCoder.encode(commentCount, forKey: "comment_count")
        }
        if comments != nil{
            aCoder.encode(comments, forKey: "comments")
        }
        if created != nil{
            aCoder.encode(created, forKey: "created")
        }
        if endDate != nil{
            aCoder.encode(endDate, forKey: "end_date")
        }
        if experienceOrder != nil{
            aCoder.encode(experienceOrder, forKey: "experience_order")
        }
        if hasLiked != nil{
            aCoder.encode(hasLiked, forKey: "has_liked")
        }
        if hashtagCount != nil{
            aCoder.encode(hashtagCount, forKey: "hashtag_count")
        }
        if hashtags != nil{
            aCoder.encode(hashtags, forKey: "hashtags")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if isFull != nil{
            aCoder.encode(isFull, forKey: "is_full")
        }
        if isPromoted != nil{
            aCoder.encode(isPromoted, forKey: "is_promoted")
        }
        if likeCount != nil{
            aCoder.encode(likeCount, forKey: "like_count")
        }
        if locationId != nil{
            aCoder.encode(locationId, forKey: "location_id")
        }
        if modified != nil{
            aCoder.encode(modified, forKey: "modified")
        }
        if pictures != nil{
            aCoder.encode(pictures, forKey: "pictures")
        }
        if skillCount != nil{
            aCoder.encode(skillCount, forKey: "skill_count")
        }
        if skills != nil{
            aCoder.encode(skills, forKey: "skills")
        }
        if slug != nil{
            aCoder.encode(slug, forKey: "slug")
        }
        if startDate != nil{
            aCoder.encode(startDate, forKey: "start_date")
        }
        if taggedUserCount != nil{
            aCoder.encode(taggedUserCount, forKey: "tagged_user_count")
        }
        if timelineDate != nil{
            aCoder.encode(timelineDate, forKey: "timeline_date")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if video != nil{
            aCoder.encode(video, forKey: "video")
        }
    }
}