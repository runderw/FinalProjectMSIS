//
//  ViewController.swift
//  FinalProjectMSIS
//
//  Created by Lavada Blanton on 3/14/20.
//  Copyright © 2020 Robert Underwood. All rights reserved.
//

import SwiftUI
import Firebase

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        
        db.collection("Attendance").document("PWC").setData(["test":"test"])
        
    }
}



