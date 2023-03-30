//
//  ViewController.swift
//  ListOfUsersDemo
//
//  Created by Tatiana Pasechnik on 30/03/23.
//

import UIKit
var students = [Student]()

func readStudnetData() -> [Student]
{
    let data = UserDefaults.standard.value(forKey: "students") as! Data
    let students = try!  NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Student]
    return students
}

func showMessage(msg:String, controller: UIViewController)

{
    let alert = UIAlertController(title: "", message: msg, preferredStyle: .actionSheet);
    let action = UIAlertAction(title: "OK", style: .default)
    {
        action
        in
        controller.dismiss(animated: true, completion: nil)
    }
    alert.addAction(action)
    controller.present(alert, animated: true, completion :nil)
    
}

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var marksTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func browseBtn(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let spic = info[.originalImage] as! UIImage
        picView.image = spic
        dismiss(animated: true)
    }
    @IBAction func addButton(_ sender: UIButton) {
        
        let sid = (Int)(idTextField.text!)
        let sname = nameTextField.text!
        let saddress = addressTextField.text!
        let smarks = (Double)(marksTextField.text!)
        let spic = picView.image

        
        let st = Student(id: sid!, name: sname, address: saddress, marks: smarks!, pic: spic!)
        
        students.append(st)
        
        let data = try! NSKeyedArchiver.archivedData(withRootObject: students, requiringSecureCoding: false)
        UserDefaults.standard.set(data, forKey: "students")
        showMessage(msg: "Student added successfully", controller: self)
        
    }
    
}

