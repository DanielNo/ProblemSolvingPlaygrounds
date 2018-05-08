//: Playground - noun: a place where people can play

import UIKit

/*
811. Subdomain Visit Count
 
 Example 2:
 Input:
 ["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]
 Output:
 ["901 mail.com","50 yahoo.com","900 google.mail.com","5 wiki.org","5 org","1 intel.mail.com","951 com"]
 Explanation:
 We will visit "google.mail.com" 900 times, "yahoo.com" 50 times, "intel.mail.com" once and "wiki.org" 5 times. For the subdomains, we will visit "mail.com" 900 + 1 = 901 times, "com" 900 + 50 + 1 = 951 times, and "org" 5 times.
 
 Approach : Split the question into subproblems. First subproblem is to split the count and domain strings. Second subsproblem is to split the domain into subdomains and store the counts in a dictionary. Third subproblem is to create a string array from keys and values in the dictionary storing the counts and domains.
 
 Time Complexity : O(n)
 Space Complexity : O(n)

*/

let input1 = ["9001 discuss.leetcode.com"]
let input2 = ["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]
let domain1 = "google.mail.com"

func subdomainVisits(_ cpdomains: [String]) -> [String] {
    var domainVisits = [String : Int]()
    var answer = [String]()
    for domain in cpdomains{
        
        findSubDomains(domain: domain, domainVisits: &domainVisits)
    }
    
    for key in domainVisits.keys{
        answer.append(String(domainVisits[key]!) + " " + key)
    }
    return answer
}

func findSubDomains(domain : String, domainVisits : inout [String : Int]){
    var domainComponents = domain.components(separatedBy: " ")
    var domainCount = Int(domainComponents[0])!
    let fullDomain = domainComponents[1]
    var subdomainCount = 0
    for char in domainComponents[1]{
        if char == "." {
            subdomainCount += 1
        }
    }
    
    let components = fullDomain.components(separatedBy: ".")
        var allDomains : [String] = []
        allDomains.append(fullDomain)
        if subdomainCount == 2 {
            allDomains.append(components[1]+"."+components[2])
            allDomains.append(components[2])

        }
        if subdomainCount == 1 {
            allDomains.append(components[1])
        }
    
        for aDomain in allDomains{
            if domainVisits[aDomain] == 0 || domainVisits[aDomain] == nil {
                domainVisits[aDomain] = domainCount
            }else{
                domainVisits[aDomain] = domainVisits[aDomain]! + domainCount
            }
        }
    
}
subdomainVisits(input2)
