//
//  ViewController.swift
//  FinalProjectMSIS
//
//  Created by Lavada Blanton on 3/14/20.
//  Copyright © 2020 Robert Underwood. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore




class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          let db = Firestore.firestore()
        db.collection("Attendance").document("PWC").setData(["test":"test"])
        
    }
}

public struct Attendance: Codable {

    
    let CWID: String
          //set as string in case someone puts an A.
    let Name: String
    let Code: String
    let Company: String
          

    enum CodingKeys: String, CodingKey {
        case CWID
        case Name
        case Code
        case Company
        
    }

}



