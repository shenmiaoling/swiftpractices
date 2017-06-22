//
//  ViewController.swift
//  tableCellCopy&Parse
//
//  Created by nhn on 2017/6/5.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    var pasteBoard = UIPasteboard.general
    var tableData: [String] = ["dog","cat","fish"]
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int{
        return tableData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //每个 tableCell 都赋值为数组的每一项
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView,shouldShowMenuForRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        if(action == #selector(UIResponderStandardEditActions.copy(_:))){
            return true
        }
        return false
    }
    func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        let cell = tableView.cellForRow(at: indexPath)
        pasteBoard.string = cell!.textLabel?.text
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

