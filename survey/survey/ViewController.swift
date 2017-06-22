//
//  ViewController.swift
//  survey
//
//  Created by nhn on 2017/6/19.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var resultView: UITextView!
    @IBAction func storeSurvey(_ sender: Any) {
        let csvLine: String = "\(firstName.text!),\(lastName.text!),\(email.text!)\n"
        //获取 Documents 目录
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let docDir: String = paths[0]
        //在获取到的 Documents 目录下添加一个名为 surveyresults.csv 的文件(使用appendingPathComponent 方法)
        let surveyFile: String = (docDir as NSString).appendingPathComponent("surveyresults.csv")
        //判断文件是否存在
        if !FileManager.default.fileExists(atPath: surveyFile) {
            FileManager.default.createFile(atPath: surveyFile, contents: nil, attributes: nil)
        }
        //更新文件内容,forUpdatingPath 用于读取和写入指定路径上的文件
        let fileHandle: FileHandle = FileHandle(forUpdatingAtPath:surveyFile)!
        
        //移动到文件末尾
        fileHandle.seekToEndOfFile()
        
        //写入数据
        fileHandle.write(csvLine.data(using: String.Encoding.utf8)!)
        
        //关闭文件
        fileHandle.closeFile()
        
        //将文本框内容清空
        firstName.text=""
        lastName.text=""
        email.text=""
    }
    @IBAction func showResults(_ sender: Any) {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let docDir: String = paths[0]
        let surveyFile: String=(docDir as NSString).appendingPathComponent("surveyresults.csv")
        
        if FileManager.default.fileExists(atPath: surveyFile) {
            let fileHandle:FileHandle=FileHandle(forReadingAtPath: surveyFile)!
            let surveyResults: String = NSString(data: fileHandle.availableData, encoding: String.Encoding.utf8.rawValue)! as String
            fileHandle.closeFile()
            resultView.text = surveyResults
        }
    }
    @IBAction func hideKeyboard(_ sender: Any) {
        firstName.resignFirstResponder()
        lastName.resignFirstResponder()
        email.resignFirstResponder()
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

