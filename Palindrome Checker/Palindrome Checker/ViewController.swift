//
//  ViewController.swift
//  Palindrome Checker
//
//  Created by Covert, Jake (J.) on 6/18/18.
//  Copyright © 2018 Woodward Pet Sitting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textLabel: UILabel!
    
    
    @IBAction func checkIfPalindrome(_ sender: UIButton) {
        
        func isPalindrome(inputString:String) -> String {
            var isPanlindomeTrue: Bool
            
            //Remove spaces
            let trimmedString = inputString.replacingOccurrences(of: " ", with: "")
            
            //Convert to lowerCase
            let caseTrimmedString = trimmedString.lowercased()
            
            //Reverse
            //let reversedString = caseTrimmedString.reversed()
            let reversedString = String(caseTrimmedString.reversed())
            
            print(reversedString)
            
            // Check if the string is the same backwards as forwards.
            // Based on that set, the flag correctly
            if caseTrimmedString == reversedString {
                isPanlindomeTrue = true
            } else {
                isPanlindomeTrue = false
            }

            // Decide which string to return..
            if isPanlindomeTrue == true {
                return "\"" + inputString + "\" is a palindrome"
            } else {
                return "\"" + inputString + "\" is not a palindrome"
            }
            
        }
        
        // Check to make sure they entered a string
        guard let fieldText = textField.text else {
            textLabel.text = "Please enter a word or phrase."
            return
        }
        
        textLabel.text = isPalindrome(inputString: fieldText)
        
    }
    
}

