//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
//    var retrievedData : Int = 1
//    var rawData : [[String:String]]?

        
    class func getRepositoriesWithCompletion(completion: (NSArray) -> ()) {
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        if let githubURL = NSURL(string:"https://api.github.com/repositories?client_id=\(clientID)&client_secret=\(clientSecret)") {
            
            print("before task")
            
            let githubTask = session.dataTaskWithURL(githubURL, completionHandler: {(data, response, error) in
                
                print("inside completion handler. data received")
                
                if let data = data {
                    do {
                        if let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSArray {
                                completion(responseData)
//                            NSOperationQueue.mainQueue().addOperationWithBlock({
//                                })
                            }
                        
//                        self.retrievedData = responseData.count
//                        self.rawData = responseData
                        
                       //  print(responseData[0]["id"])
                    } catch {
                        print("Fail!")
                    }
                }
            })
            print("before resuming task")
            githubTask.resume()
            print("after resuming task")
        }
        
    }

        
    }

