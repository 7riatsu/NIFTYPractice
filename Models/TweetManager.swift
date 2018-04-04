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
        query?.findObjectsInBackground { (objects, error) in
            if error == nil {
                self.tweets = []
                for object in objects! {
                    let text = (object as AnyObject).object(forKey: "text") as! String
                    let tweet = Tweet(text: text)
                    self.tweets.append(tweet)
                    callback()
                }
            }
        }
    }
}
