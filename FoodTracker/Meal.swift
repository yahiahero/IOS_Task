//
//  ViewController.swift
//  Projet_tchek
//
//  Created by Islam on 26/04/2018.
//  Copyright © 2018 Islam. All rights reserved.
//

import UIKit
import os.log


class Meal: NSObject, NSCoding {
    
    //MARK: Properties
    
    var name: String
    var categ: String
    var date1: Date
    //var dueDate: Date
    
    //let dateFormatterGet = DateFormatter()
    
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("Task")
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let categ = "categ"
        static let date1 = "Datee"
    }
    
    //MARK: Initialization
    init?(name: String, categ: String, date1 : Date) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        guard !categ.isEmpty else {
            return nil
        }
        // Initialize stored properties.
        self.name = name
        self.categ = categ
        self.date1 = date1
        //self.photo = photo
        //self.rating = rating
        }
    
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(categ, forKey: PropertyKey.categ)
        aCoder.encode(date1, forKey: PropertyKey.date1)
        
    }
    
    
    
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let categ = aDecoder.decodeObject(forKey: PropertyKey.categ) as? String else {
            os_log("Unable to decode the categorie for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        let date1 = aDecoder.decodeObject(forKey: PropertyKey.date1) as! Date
        
        // Must call designated initializer.
        self.init(name: name, categ: categ, date1:date1)
    }
    
    
}







