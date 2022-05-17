//
//  ViewController.swift
//  Bitcode Training
//
//  Created by Mac on 11/04/22.
//

import UIKit

class ViewController: UIViewController, SecondDataPassprotocol, UITableViewDataSource, UITableViewDelegate{
    
    // MARK: TableView Outlet
    @IBOutlet weak var bitcodeStudentList: UITableView!
    var nameArray: [String] = []
    var technologyArray: [String] = []
    var ageArray: [String] = []
    var phoneNoArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "First VC"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.add,target:self, action: #selector(rightBarButtonAction))
        bitcodeStudentList.dataSource = self
        bitcodeStudentList.delegate = self
    }
    
    // MARK: Outlet For + Button
    @IBAction func rightBarButtonAction(){
        if let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            secondVC.delegateSVC = self
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
        else{
            print("secondVC object has no value")
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if nameArray.count > 0 {
            self.bitcodeStudentList.backgroundView = nil
            return nameArray.count
        }
        showEmptyLabel()
        return 0
    }
    
    // MARK: Create Empty Label Method
    private func showEmptyLabel(){
        let rect = CGRect(x: 0, y: 0, width: self.bitcodeStudentList.bounds.size.width, height: self.bitcodeStudentList.bounds.size.height)
        let noDataLabel: UILabel = UILabel(frame:rect)
        noDataLabel.text = "No Data Available"
        noDataLabel.textColor = UIColor.black
        noDataLabel.textAlignment = NSTextAlignment.center
        self.bitcodeStudentList.backgroundView = noDataLabel
        self.bitcodeStudentList.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.bitcodeStudentList.dequeueReusableCell(withIdentifier: "BitcodeStudentListTableViewCell") as? BitcodeStudentListTableViewCell else{
            return UITableViewCell()
        }
        cell.nameLabel.text = nameArray[indexPath.row]
        cell.technologyLabel.text = technologyArray[indexPath.row]
        cell.ageLabel.text = ageArray[indexPath.row]
        cell.phoneNoLabel.text = phoneNoArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            bitcodeStudentList.beginUpdates()
            nameArray.remove(at: indexPath.row)
            bitcodeStudentList.deleteRows(at: [indexPath], with: .fade)
            bitcodeStudentList.endUpdates()
        }
    }
    
    //MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    // MARK: DataPassing From VC2 to VC1
    func passData(name: String?, technology: String?, age: String?, phoneNo: String?) {
        nameArray.append(name ?? "")
        technologyArray.append(technology ?? "")
        ageArray.append(age ?? "")
        phoneNoArray.append(phoneNo ?? "")
        bitcodeStudentList.reloadData()
    }
    
}



