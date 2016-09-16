////
////  serverResponse.swift
////  dror gal
////
////  Created by dror gal on 1/11/16.
////  Copyright © 2016 Dev. All rights reserved.
////
//
//import Foundation
//
//class WebServices {
//    
//    static let Instance = WebServices()
//    
//    fileprivate init() {
//        
//    }
//    
//    func postSyncJSON(_ params : Dictionary<String, String>, url : String, postCompleted : @escaping (_ success: Bool, _ result : ServerResponse ) -> ()) {
//        let mutex : DispatchSemaphore = DispatchSemaphore(value: 0)
//        let completion = postCompleted
//        postAsyncJSON(params, url: url, postCompleted: {success, result -> Void in
//                completion(success, result)
//                mutex.signal()
//            })
//        mutex.wait(mutex,DISPATCH_TIME_FOREVER)
//    }
//    
//    func postAsyncJSON(_ params : Dictionary<String, String>, url : String, postCompleted : @escaping (_ success: Bool, _ result : ServerResponse ) -> ()) {
//        //create the url with NSURL
//        let nsURL = URL(string: url) //change the url
//        
//        //create the session object
//        let session = URLSession.shared
//        let request = NSMutableURLRequest(url: nsURL!)
//        request.httpMethod = "POST" //set http method as POST
//        
//        //request.HTTPBody = NSJSONSerialization.dataWithJSONObject(parameters, options: nil, error: &err) // pass dictionary to nsdata object and set it as request body
//        
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//        request.setBodyContent(params)
//        //create dataTask using the session object to send data to the server
//        let task = session.dataTask(with: request, completionHandler: {data, response, error -> Void in
//            do {
//                var responseData = data
//                if responseData == nil {
//                    responseData = Data()
//                }
//                let serverResponse = ServerResponse(data: responseData!)
//                postCompleted(success: true, result: serverResponse)
//                
//                if(error != nil) {
//                    print(error!.localizedDescription)
//                    let jsonStr = NSString(data: responseData!, encoding: String.Encoding.utf8)
//                    print("Error could not parse JSON: '\(jsonStr)'")
//                } else {
//                    // The JSONObjectWithData constructor didn't return an error. But, we should still
//                    // check and make sure that json has a value using optional binding.
//                    if let parseJSON = serverResponse.getAsDictionary() as NSDictionary! {
//                        // Okay, the parsedJSON is here, let's get the value for 'success' out of it
//                        _ = parseJSON["success"] as? Int
//                        //println("Succes: \(success)")
//                    } else {
//                        // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
//                        _ = NSString(data: data!, encoding: String.Encoding.utf8)
//                        // println("Error could not parse JSON: \(jsonStr)")
//                        }
//                    }
//            } catch {
//                print("PostAsyncJson error")
//            
//
//                
//            }
//            
//        })
//        
//        task.resume()
//    }
//
//}
//extension NSMutableURLRequest {
//    func setBodyContent(_ contentMap: Dictionary<String, String>) {
//        var firstOneAdded = false
//        var contentBodyAsString = String()
//        let contentKeys:Array<String> = Array(contentMap.keys)
//        for contentKey in contentKeys {
//            if(!firstOneAdded) {
//                
//                contentBodyAsString = contentBodyAsString + contentKey + "=" + contentMap[contentKey]!
//                firstOneAdded = true
//            }
//            else {
//                contentBodyAsString = contentBodyAsString + "&" + contentKey + "=" + contentMap[contentKey]!
//            }
//        }
//        contentBodyAsString = contentBodyAsString.addingPercentEscapes(using: String.Encoding.utf8)!
//        self.httpBody = contentBodyAsString.data(using: String.Encoding.utf8)
//    }
//}
