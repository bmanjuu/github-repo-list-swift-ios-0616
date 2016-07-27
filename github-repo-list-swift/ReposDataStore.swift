//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repoArray = [GithubRepository]()
    
    func getRepositoriesWithCompletion(completion: () -> ()) {
        GithubAPIClient.getRepositoriesWithCompletion { (inputRepoArray) in
            self.repoArray.removeAll()
            for repo in inputRepoArray {
                guard let repoDictionary = repo as? NSDictionary else {return}
                self.repoArray.append(GithubRepository.init(dictionary: repoDictionary))
            }
            print ("about to call completion within call to GithubAPIClient: \(self.repoArray.count)")
            completion()
        }
        print ("about to call completion: \(repoArray.count)")
        completion()
    }

}
