//
//  Student.swift
//  ListOfUsersDemo
//
//  Created by Tatiana Pasechnik on 30/03/23.
//
import UIKit
import Foundation

class Student: NSObject, NSCoding
{
    func encode(with coder: NSCoder) {
        coder.encode(id, forKey: "id")
        coder.encode(name,forKey: "name")
        coder.encode(address, forKey: "address")
        coder.encode(marks, forKey: "marks")
        coder.encode(pic, forKey: "pic")
    }
    
    required init?(coder: NSCoder) {
        self.id = coder.decodeInteger(forKey: "id")
        self.name = coder.decodeObject(forKey: "name") as! String
        self.address = coder.decodeObject(forKey: "address") as! String
        self.marks = coder.decodeDouble(forKey: "marks")
        self.pic = coder.decodeObject(forKey: "pic") as! UIImage
    }
    
    var id: Int
    var name: String
    var address: String
    var marks: Double
    var pic : UIImage
    init(id:Int,name:String,address:String,marks:Double, pic: UIImage) {
        self.id = id
        self.name = name
        self.address = address
        self.marks = marks
        self.pic = pic
    }
}
