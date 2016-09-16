//
//  ViewControllerUtils.swift
//  MindoLife
//
//  Created by dror gal on 1/6/16.
//  Copyright © 2016 Dev. All rights reserved.
//

import Foundation
import UIKit


public class ViewControllerUtils{
    
    public static func doOnMain(callback : @escaping MainThreadCallback) {
    
        DispatchQueue.main.async {
            callback()
        }
    }
    
}
