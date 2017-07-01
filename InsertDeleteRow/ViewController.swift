//
//  ViewController.swift
//  InsertDeleteRow
//
//  Created by Vijay Adhikari on 01/07/2017.
//  Copyright © 2017 Vijay Adhikari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var ContentTable: UITableView!
   
    
    @IBOutlet weak var txtView: UITextField!
    
    //
    var dataArray = ["swift is awesome language", "iPhone 7 is nice", "we love apple"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ContentTable.estimatedRowHeight = 78
        ContentTable.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  =  ContentTable.dequeueReusableCell(withIdentifier: "cell") as! dataCell
        cell.title.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataArray.remove(at: indexPath.row)
            ContentTable.beginUpdates()
            ContentTable.deleteRows(at: [indexPath], with: .automatic)
            ContentTable.endUpdates()
        }
    }
    
    @IBAction func addRow(_ sender: UIButton) {
        
        if (txtView.text?.isEmpty)! {
            return
        }
        dataArray.append(txtView.text!)
        
        let indexPath = IndexPath(row: dataArray.count - 1 , section: 0)
        ContentTable.beginUpdates()
        ContentTable.insertRows(at: [indexPath], with: .automatic)
        ContentTable.endUpdates()
        txtView.text = ""
        view.endEditing(true)
        
        
    }
    
    
    
    
}

