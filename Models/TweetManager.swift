//
//  TweetManager.swift
//  NIFTYPractice
//
//  Created by 成田篤基 on 2018/04/04.
//  Copyright © 2018年 Atsuki Narita. All rights reserved.
//

import UIKit

class TweetManager: NSObject {
    static let sharedInstance = TweetManager()
    var tweets: [Tweet] = []
    
    func fetchTweets(callback: @escaping () -> Void) {
        let query = NCMBQuery(className: "Tweet")
        query?.includeKey("user")
        query?.order(byDescending: "createDate")
        query?.findObjectsInBackground { (objects, error) in
            if error == nil {
                self.tweets = []
                for object in objects! {
                    let text = (object as AnyObject).object(forKey: "text") as! String
                    let tweet = Tweet(text: text)
                    let userObject = (object as AnyObject).object(forKey: "user") as! NCMBUser
                    print(userObject.userName!)
                    let user = User(name: userObject.userName!, password: "")
                    self.tweets.append(tweet)
                    callback()
                }
            }
        }
    }
}
