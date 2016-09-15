//
//  LoginsViewController.swift
//  SoundMe
//
//  Created by dror gal on 05/08/2016.
//  Copyright © 2016 dror gal. All rights reserved.
//

import UIKit
import MediaPlayer
import FBSDKCoreKit
import FBSDKLoginKit

class LoginsViewController: UIViewController,FBSDKLoginButtonDelegate {
    @IBOutlet weak var loginWithSoundMe: UIImageView!
   // var ref:FIRDatabaseReference!
    @IBOutlet weak var signInWithFaceBook: UIImageView!

  //  @IBOutlet weak var loginButton: FBSDKLoginButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureSignInWithFceBook = UITapGestureRecognizer(target: self, action:#selector(LoginsViewController.SignInWithFaceBook))
        tapGestureSignInWithFceBook.numberOfTapsRequired = 1
        self.signInWithFaceBook.isUserInteractionEnabled = true
        self.signInWithFaceBook.addGestureRecognizer(tapGestureSignInWithFceBook)
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(LoginsViewController.actionLoginSoundMe))
        tapGesture.numberOfTapsRequired = 1
        self.loginWithSoundMe.addGestureRecognizer(tapGesture)

        // allow for user interaction
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "backgroundLogin")!.draw(in: self.view.bounds)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image!)

//
//        let myImage = UIImage(named: "loadback")
//        imageResize(myImage!, sizeChange: CGSize(width: self.view.frame.width, height: self.view.frame.height))
//        self.view.backgroundColor = UIColor(patternImage: myImage!)
//        self.view.contentMode = UIViewContentMode.ScaleAspectFit

//        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
//        ref = FIRDatabase.database().reference()
//      //  checkIfLogin()
//        
//        let mediaItems = MPMediaQuery.songsQuery().items
//        for song in mediaItems! {
//            print(song.title)
//        }
//        // Or you can filter on various property
//        // Like the Genre for example here
//        var query = MPMediaQuery.songsQuery()
//        let predicateByGenre = MPMediaPropertyPredicate(value: "Rock", forProperty: MPMediaItemPropertyGenre)
//        query.filterPredicates = NSSet(object: predicateByGenre) as! Set<MPMediaPredicate>
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func actionLoginSoundMe(){
        self.performSegue(withIdentifier: "goLoginSoundMe", sender: self)

    }


    
    /////function sign with faceboof sahar vanunu
    
    func SignInWithFaceBook(){
        let SignWithFacebookManager: FBSDKLoginManager = FBSDKLoginManager()
        SignWithFacebookManager.logIn(withReadPermissions: ["email"], from: self, handler: {(result,error)-> Void in
            if (error == nil){
                let fbSignInResult : FBSDKLoginManagerLoginResult = result!
                if(fbSignInResult.grantedPermissions.contains("email"))
                {
                    self.getUserData()

                }
            }
            }
            )
    }
    
    func getUserData(){
        if ((FBSDKAccessToken.current()) != nil) {
            let deatailParameters = ["fields": "email, first_name, last_name, picture.type(large)"]
            FBSDKGraphRequest(graphPath: "Me", parameters: deatailParameters ).start(completionHandler: { (connection,result,error) -> Void in
                if error != nil {
                    print(error)
                }
                else {
                   //  let email = result["email"] as? String
                   // print(email)
                    print(result)
                
                }
            })
        }
    }

    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("sucess")
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    
    
    
    
    ///===end function sahar vanunu===
    
    
    
    
    
//    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
//        
//    }
//    
//    @IBAction func syncbutton(sender: FBSDKLoginButton) {
//        
//    }
//    
// 
//
//    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
//        print("result \(result)")
//        returnUserData()
//    }
//    
//    func checkIfLogin(){
//        if (FBSDKAccessToken.currentAccessToken() != nil) {
//                self.performSegueWithIdentifier("facebook", sender: self)
//        }
//
//    }
//    
//    func returnUserData()
//    {
//        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name,gender,age_range,link,locale,picture,timezone,updated_time,verified"])
//        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
//            if ((error) != nil)
//            {
//                // Process error
//                print("Error: \(error)")
//            }
//            else
//            {
//                let userName : NSString = result.valueForKey("name") as! NSString
//                let email : NSString = result.valueForKey("email") as! NSString
//                let gender : NSString = result.valueForKey("gender") as! NSString
//                let type : NSString = "lisner"
//                
//   
//                let key = self.ref.child("posts").childByAutoId().key
//                let post = ["name": userName,
//                    "email": email,
//                    "gender": gender,
//                    "type": type]
//                let childUpdates = ["/user-posts/\(userName)/": post]
//                self.ref.updateChildValues(childUpdates)
//                print("fetched user: \(result)")
//                print("User Name is: \(userName)")
//                
//                self.performSegueWithIdentifier("facebook", sender: self)
//            }
//        })
//    }
    
    
    
}
