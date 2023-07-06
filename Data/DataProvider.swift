//
//  DataProvider.swift
//  Travel App
//
//  Created by Shubhdeep on 2023-03-01.
//

import Foundation
import UIKit

class DataProvider {
    
    static func mockPlacesData() -> [Place] {
        
        return [
        Place(image: UIImage(named: "photo2"),name: "Vancouver"),
        Place(image: UIImage(named: "photo2"),name: "Italy"),
        Place(image: UIImage(named: "photo2"),name: "Toronto"),
        Place(image: UIImage(named: "photo2"),name: "Calgary"),
        Place(image: UIImage(named: "photo2"),name: "Winnipeg")
        ]
        
    }
    
    
    static func makeMockData() -> [(String, [User])] {
        
        var aSection: [User] = []
        var bSection: [User] = []
        var cSection: [User] = []
        
        aSection.append(
            User(
                nickName: "Alexander Valley",
                location: "Vancouver",
                age: "29",
                image: UIImage(named: "profileA1")
            )
        )
        
        aSection.append(
            User(
            nickName: "Alex Stanton",
            location: "Vancouver",
            age: "32",
            image: UIImage(named: "profileA2")
            )
        )
        
        bSection.append(
            User(
                nickName: "Brian Self",
                location: "Montreal",
                age: "40",
                image: UIImage(named: "profileB1")
            )
        )
        
        bSection.append(
        User(
            nickName: "Benika Stanton",
            location: "Vancouver",
            age: "23",
            image: UIImage(named: "profileB2")
            )
        )
        bSection.append(
        User(
            nickName: "Benika Stanton",
            location: "Vancouver",
            age: "25",
            image: UIImage(named: "profileB3")
            )
        )
        
        cSection.append(
            User(
                nickName: "Alexander Valley",
                location: "Vancouver",
                age: "29",
                image: UIImage(named: "profileA1")
            )
        )
        
        cSection.append(
            User(
            nickName: "Alex Stanton",
            location: "Vancouver",
            age: "32",
            image: UIImage(named: "profileA2")
            )
        )
        
        return [
        ("A", aSection),
        ("B", bSection),
        ("C", cSection)
        ]

    }
}
