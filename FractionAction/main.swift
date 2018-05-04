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


var numerator = -1 //outside the loop
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
    numerator = givenInteger
    break   //quit the while loop and begin the PROCESS section
    
}


// PROCESS
// Implement the primary logic of the problem here


// OUTPUT
// Report results to the user here

let quoitent = numerator / denominator
