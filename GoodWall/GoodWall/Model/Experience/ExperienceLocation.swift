//
//  ExperienceLocation.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 10, 2018

import Foundation


class ExperienceLocation : NSObject, NSCoding{

    var adminArea1 : AnyObject!
    var adminArea2 : AnyObject!
    var country : String!
    var formattedAddress : String!
    var id : Int!
    var latitude : Float!
    var locality : String!
    var longitude : Float!
    var postalCode : Int!
    var shortCountryName : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        adminArea1 = dictionary["admin_area_1"] as? AnyObject
        adminArea2 = dictionary["admin_area_2"] as? AnyObject
        country = dictionary["country"] as? String
        formattedAddress = dictionary["formatted_address"] as? String
        id = dictionary["id"] as? Int
        latitude = dictionary["latitude"] as? Float
        locality = dictionary["locality"] as? String
        longitude = dictionary["longitude"] as? Float
        postalCode = dictionary["postal_code"] as? Int
        shortCountryName = dictionary["short_country_name"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if adminArea1 != nil{
            dictionary["admin_area_1"] = adminArea1
        }
        if adminArea2 != nil{
            dictionary["admin_area_2"] = adminArea2
        }
        if country != nil{
            dictionary["country"] = country
        }
        if formattedAddress != nil{
            dictionary["formatted_address"] = formattedAddress
        }
        if id != nil{
            dictionary["id"] = id
        }
        if latitude != nil{
            dictionary["latitude"] = latitude
        }
        if locality != nil{
            dictionary["locality"] = locality
        }
        if longitude != nil{
            dictionary["longitude"] = longitude
        }
        if postalCode != nil{
            dictionary["postal_code"] = postalCode
        }
        if shortCountryName != nil{
            dictionary["short_country_name"] = shortCountryName
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        adminArea1 = aDecoder.decodeObject(forKey: "admin_area_1") as? AnyObject
        adminArea2 = aDecoder.decodeObject(forKey: "admin_area_2") as? AnyObject
        country = aDecoder.decodeObject(forKey: "country") as? String
        formattedAddress = aDecoder.decodeObject(forKey: "formatted_address") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        latitude = aDecoder.decodeObject(forKey: "latitude") as? Float
        locality = aDecoder.decodeObject(forKey: "locality") as? String
        longitude = aDecoder.decodeObject(forKey: "longitude") as? Float
        postalCode = aDecoder.decodeObject(forKey: "postal_code") as? Int
        shortCountryName = aDecoder.decodeObject(forKey: "short_country_name") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if adminArea1 != nil{
            aCoder.encode(adminArea1, forKey: "admin_area_1")
        }
        if adminArea2 != nil{
            aCoder.encode(adminArea2, forKey: "admin_area_2")
        }
        if country != nil{
            aCoder.encode(country, forKey: "country")
        }
        if formattedAddress != nil{
            aCoder.encode(formattedAddress, forKey: "formatted_address")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if latitude != nil{
            aCoder.encode(latitude, forKey: "latitude")
        }
        if locality != nil{
            aCoder.encode(locality, forKey: "locality")
        }
        if longitude != nil{
            aCoder.encode(longitude, forKey: "longitude")
        }
        if postalCode != nil{
            aCoder.encode(postalCode, forKey: "postal_code")
        }
        if shortCountryName != nil{
            aCoder.encode(shortCountryName, forKey: "short_country_name")
        }
    }
}