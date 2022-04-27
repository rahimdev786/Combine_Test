//
//  Combine.swift
//  Combine_Test
//
//  Created by arshad on 4/27/22.
//


/*
 
 Combines:
    -->A unified declarative API for processing values over time.
    -->This means that if any values changes from backend its responced that values update automatically.
    -->these also be used like a communication Pattern
    
 Combine has some core concepts that need to be understood:
  Publisher and Subscriber
  Operator
  Subject
 
 Publisher and Subscriber:
    Publisher  --> One
    Subscriber --> many
 

 */

import Foundation
import Combine

class CombineCall{
    static let shared:CombineCall = CombineCall()
    
    func apiCall() -> Future<[String],Error>{
        return Future { promise in
            
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                promise(.success(["sucess","Bottom","data Inserting","single files"]))
            }
        }
    }
}

