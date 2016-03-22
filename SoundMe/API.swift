//
//  API.swift
//  SoundMe
//
//  Created by dror gal on 3/5/16.
//  Copyright © 2016 dror gal. All rights reserved.
//

import Foundation
import Parse


public class API{
    struct APIKey {
        static let UserName = "name"
        static let Password = "password"
        static let className = "newUser"
    }
    
    static func saveObject(keyToSave:String,valueToSave:String,callback:(success:Bool)->()){
        let object = PFObject(className:APIKey.className)
        object[keyToSave] = valueToSave
        object.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                callback(success: true)
            } else {
                callback(success: false)
            }
        }
    }
    
    static func checkUserName(userName:String,password:String,callback:(success:Bool,result:String?)->()){
        let query = PFQuery(className:APIKey.className)
        query.whereKey(APIKey.UserName, equalTo:userName)
        query.whereKey(APIKey.Password, equalTo:password)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil{
                if objects!.isEmpty{
                    print("error user name")
                }else{
                let object = objects!.first
                callback(success: true, result: object!.objectId!)
                }
            } else {
                callback(success: false, result: nil)
                print("Error: \(error!)")
            }
        }
    }
    
    
    
    
    
    
    
    
    
}