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
    
    init(dictionary: NSDictionary) {
        self.fullName = dictionary["full_name"] as? NSString
        self.repositoryID = dictionary["id"] as? NSString
        self.htmlURL = dictionary["html_url"] as? NSURL
    }
    
    
}
