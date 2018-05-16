//
//  main.swift
//  FractionAction
//
//  Created by Gordon, Russell on 2018-04-04.
//  Copyright © 2018 Gordon, Russell. All rights reserved.
//

import Foundation

// INPUT
// Collect and filter user input here


var providedNumerator = -1 //outside the loop
prompt: while 1 == 1 {
    
    //Prompt the user
    print("Numerator?")
    
    //wait for input
    //make sure it is not nil
    guard let givenInput = readLine() else {
        
        //if we got here, input is nil
        //prompt again
        continue  //continue with the next interation of 'while' loop
        
    }
    
    // Test #2: is the input the correct type
    guard let givenInteger = Int(givenInput) else {
        
        //if we got here, input is not a number
        continue //prompt again
        
    }
    
    // test #3: Make sure numerator can't be negative
    if givenInteger < 0 {
        
        // aw, bad input, numerator can't be negative
        continue
        
    }
    
    // if we got to this point, we know the input is good
    providedNumerator = givenInteger
    break   //quit the while loop and begin the PROCESS section
    
}


var providedDenominator = -1 //outside the loop
prompt: while 1 == 1 {
    
    //Prompt the user
    print("Denominator?")
    
    //wait for input
    //make sure it is not nil
    guard let givenInput = readLine() else {
        
        //if we got here, input is nil
        //prompt again
        continue  //continue with the next interation of 'while' loop
        
    }
    
    // Test #2: is the input the correct type
    guard let givenInteger = Int(givenInput) else {
        
        //if we got here, input is not a number
        continue //prompt again
        
    }
    
    // test #3: Make sure denominator can't be negative
    if givenInteger < 0 {
        
        // aw, bad input, denominator can't be negative
        continue
        
    }
    
    // test #4: Make sure denominator can't be 0
    if givenInteger == 0 {
        
        // aw, bad input, denominator can't be zero
        continue
        
    }
    
    // if we got to this point, we know the input is good
    providedDenominator = givenInteger
    break   //quit the while loop and begin the PROCESS section
    
}


// PROCESS + OUTPUT
// Report results to the user here

let quotient = providedNumerator / providedDenominator
let initialOutputNumerator = providedNumerator % providedDenominator
let initialOutputDenominator = providedDenominator

// in response to input
print("The result is:")

// Is the result a whole number?
if initialOutputNumerator == 0 {
    
    // We have a whole number, we are done
    print(quotient)
    
} else {
    
    // We might have to reduce it then
    
    // Check if the initial output numerator is the GCF
    if initialOutputDenominator % initialOutputNumerator == 0 {
        // Get reduced numerator and denominator
        let reducedOutputNumerator = 1
        let reducedOutputDenominator = initialOutputDenominator / initialOutputNumerator
        
        // Print reduced fraction
        if quotient > 0 {
            print("\(quotient) \(reducedOutputNumerator)/\(reducedOutputDenominator)")
        } else {
            // don't show a remainder of 0
            print("\(reducedOutputNumerator)/\(reducedOutputDenominator)")
        }
        
    } else {
        
        var greatestCommonFactor = -1 // not actual GCF yet
        for possibleFactor in stride(from: initialOutputNumerator / 2, through: 2, by: -1) {
            if initialOutputNumerator % possibleFactor == 0 && providedDenominator % possibleFactor == 0 {
                
                // Now we know that "possibleFactor" is the greatest common factor (GCF)
                greatestCommonFactor = possibleFactor
                break // stop the loop
            }
        }
        
        // Get the parts of the reduced fraction
        let reducedOutputNumerator = initialOutputNumerator / greatestCommonFactor
        let reducedOutputDenominator = providedDenominator / greatestCommonFactor
        
        // Print the reduced fraction
        if quotient > 0 {
            print("\(quotient) \(reducedOutputNumerator)/\(reducedOutputDenominator)")
        } else {
            // Don't show the quotiet when it is 0
            print("\(reducedOutputNumerator)/\(reducedOutputDenominator)")
        }
        
    }
    
}
