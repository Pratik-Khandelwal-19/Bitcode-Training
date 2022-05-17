//
//  SecondViewController.swift
//  Bitcode Training
//
//  Created by Mac on 11/04/22.
//

import UIKit
class SecondViewController: UIViewController {
    // MARK : Textfield Outlets
    @IBOutlet weak var nameTF1: UITextField!
    @IBOutlet weak var technologyTF2: UITextField!
    @IBOutlet weak var ageTF3: UITextField!
    @IBOutlet weak var phonenoTF4:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second VC"
        navigationItem.hidesBackButton = true
        
    }
    // MARK: Linking Protocol With VC2
    weak var delegateSVC: SecondDataPassprotocol?
    
    // MARK : Alerts
    func showSaveAlert(){
        let alert = UIAlertController(title: "SaveButtonTapped", message: "DataSavedSucessfully!!!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "GoodToGo", style: .default, handler: { [weak self] action in
            guard let delegate = self?.delegateSVC
            else{
                print("no delegate object on storyboard")
                return
            }
            let data1 = self?.nameTF1.text
            let data2 = self?.technologyTF2.text
            let data3 = self?.ageTF3.text
            let data4 = self?.phonenoTF4.text
            
            delegate.passData(name: data1, technology: data2, age: data3, phoneNo: data4)
            self?.navigationController?.popViewController(animated: true) }))
        present(alert, animated: true)
    }
    
    func showDismissAlert(){
        let alert = UIAlertController(title: "SaveButtonTapped", message: "CompleteTheDetails", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in
            print("tapped") }))
        present(alert, animated: true)
    }
    
    // MARK: Action For Save Button
    @IBAction func saveButton(){
        let data1 = nameTF1.text
        let data2 = technologyTF2.text
        let data3 = ageTF3.text
        let data4 = phonenoTF4.text
        
        // MARK : Alerts
        if ((data1 != "") && (data2 != "") && (data3 != "" ) && (data4 != ""))
        {
            showSaveAlert()
        }
        else{
            showDismissAlert()
        }
    }
}
