//
//  ViewController.swift
//  Palindrome Checker
//
//  Created by Covert, Jake (J.) on 6/18/18.
//  Copyright © 2018 Woodward Pet Sitting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func isPalindrome(inputString:String) -> String {
        var isPanlindomeTrue: Bool
        
        //Remove spaces and any special characters using extention at the bottom..
        let  cleanString = inputString.stripped
        
        //Convert to lowerCase
        //The is the forward point of comparison..
        let forwardString = cleanString.lowercased()
        
        //Reverse and lowercase
        //The is the reverse point of comparison..
        let reversedString = String(cleanString.lowercased().reversed())
        
        // Check if the string is the same backwards as forwards.
        // Based on that set, the flag correctly
        if forwardString == reversedString {
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
    
    func verifyFieldText(optionalString: String?) -> String {
        // Check to make sure they entered a string
        guard let fieldText = textField.text else {
            return "Please enter a word or phrase."
        }
        if fieldText == "" {
           return "Please enter a word or phrase."
        }
        return isPalindrome(inputString: fieldText)
    }
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func checkIfPalindrome(_ sender: UIButton) {
        
        // Call the "verifyFieldText" function.
        // Input is textField, and output is textLabel
        textLabel.text = verifyFieldText(optionalString: textField.text)
    }
}

extension String {
    
    // Sourced from https://stackoverflow.com/questions/32851720/how-to-remove-special-characters-from-string-in-swift-2/32851930
    // using Swift 4 answer from Maksim Kniazev.
    var stripped: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return self.filter {okayChars.contains($0) }
    }
}
