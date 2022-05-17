//
//  main.swift
//  GroupBy
//
//  Created by Rostyslav Gress on 17.03.22.
//

import Foundation


let groupedByDate = groupBy([
   ["amount": 100, "date": "5/5/2016"],
   ["amount": 200, "date": "6/5/2016"],
   ["amount": 300, "date": "5/5/2016"]
], "date")

print("Result -> ", groupedByDate)


func groupBy(_ array: [[String: AnyHashable]], _ order: String) -> [String: [[String: AnyHashable]]] {
    var groupedValues = [String: [[String: AnyHashable]]]()
    
    if let keys = Array(Set(array.compactMap { $0[order] })) as? [String] {
        let sortedKeys = keys.sorted()

        for key in sortedKeys {
            var mappedArray = [[String: AnyHashable]]()
            
            for values in array {
                if let string = values[order] as? String, string == key {
                    mappedArray.append(values)
                }
            }
            
            if !mappedArray.isEmpty  {
                groupedValues[key] = mappedArray
            }
        }
    }

    return groupedValues
}
