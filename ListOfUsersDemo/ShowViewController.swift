//
//  ShowViewController.swift
//  ListOfUsersDemo
//
//  Created by Tatiana Pasechnik on 30/03/23.
//

import UIKit

class ShowViewController: UIViewController {

    @IBOutlet weak var ideTextField: UITextField!
    
    @IBOutlet weak var nameField: UILabel!
    
    @IBOutlet weak var addressField: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var marksField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        nameField.isHidden = true
        addressField.isHidden = true
        marksField.isHidden = true
        imageView.isHidden = true
    }
    

    @IBAction func showBtn(_ sender: UIButton) {
        let id = (Int)(ideTextField.text!)
        if id == nil {
            showMessage(msg: "Please enter ID", controller: self)
        }
        let students = readStudnetData()
        var found : Student! = nil
        for st in students
        {
            if st.id == id
            {
                found = st
                break
            }
        }
        if found != nil
        {
            nameField.isHidden = false
            addressField.isHidden = false
            marksField.isHidden = false
            imageView.isHidden = false
            
            nameField.text = "Name: \(found.name)"
            addressField.text = "Address: \(found.address)"
            marksField.text = "Marks: \(found.marks)"
            imageView.image = found.pic
            
        }
         else
        {
             showMessage(msg: "No student found", controller: self)
         }
        
        
    }
    
}
