//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {

    var fullName : NSString?
    var htmlURL : NSURL?
    var repositoryID : NSString?
    
    init(dictionary: [String: String]) {
        if let fullNameValue = dictionary["full_name"] {self.fullName = fullNameValue}
        // self.fullName = dictionary["full_name" as? String 
        if let repositoryIDValue = dictionary["id"] {self.repositoryID = repositoryIDValue}
        if var htmlURLValue = dictionary["html_url"] {
            let stringURL = String(self.htmlURL)
            htmlURLValue = stringURL
        }
    }

    
    
    
}
