//
//  Tweet.swift
//  NIFTYPractice
//
//  Created by 成田篤基 on 2018/04/04.
//  Copyright © 2018年 Atsuki Narita. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var text: String
    var user: User?
    
    init(text: String) {
        self.text = text
    }
    
    func save(callback: @escaping () -> Void) {
        let tweetObject = NCMBObject(className: "Tweet")
        tweetObject?.setObject(text, forKey: "text")
        tweetObject?.setObject(NCMBUser.current(), forKey: "user")
        tweetObject?.saveInBackground { (error) in
            if error == nil {
                print("保存完了！")
                callback()
            }
        }
    }
}
