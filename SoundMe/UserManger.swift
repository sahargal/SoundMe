//
//  UserManger.swift
//  SoundMe
//
//  Created by dror gal on 3/5/16.
//  Copyright © 2016 dror gal. All rights reserved.
//

import Foundation

public class UserManger{
    
    public func checkUser(userName:String,password:String){
        API.checkUserName(userName, password: password) { (success, result) -> () in
            if success {
                print(result)
            }else{
                print(result)
            }
        }
    }




    func drorhomo(){
    }

    static let Instance = UserManger()





















}