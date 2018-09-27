//
//  ViewController.swift
//  experiments
//
//  Created by user909680 on 4/23/18.
//  Copyright © 2018 user909680. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        
        if tableView == self.tableView1 {
            count = sampleData.count
        }
        
        if tableView == self.tableView2 {
            count =  sampleData1.count
        }
        
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        
        if tableView == self.tableView1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let previewDetail = sampleData[indexPath.row]
            cell!.textLabel!.text = previewDetail.title
            
        }
        
        if tableView == self.tableView2 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            let previewDetail = sampleData1[indexPath.row]
            cell!.textLabel!.text = previewDetail.title
            
        }
        
        
        
        return cell!
    }
    

    @IBOutlet weak var tableView1: UITableView!
    
    @IBOutlet weak var tableView2: UITableView!
    
    struct PreviewDetail {
        let title: String
        let preferredHeight: Double
    }
    
    let sampleData = [
        PreviewDetail(title: "Small", preferredHeight: 160.0),
        PreviewDetail(title: "Medium", preferredHeight: 320.0),
        PreviewDetail(title: "Large", preferredHeight: 0.0) // 0.0 to get the default height.
    ]
    
    var sampleData1 = [
        PreviewDetail(title: "One", preferredHeight: 160.0),
        PreviewDetail(title: "Two", preferredHeight: 320.0),
        PreviewDetail(title: "Three", preferredHeight: 0.0), // 0.0 to get the default height.
        PreviewDetail(title: "More", preferredHeight: 0.0) // 0.0 to get the default height.
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView2.isEditing = true
        // Do any additional setup after loading the view, typically from a nib.
        tableView1.dataSource = self
        tableView1.delegate = self
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
         self.tableView2.isEditing = true
        tableView2.dataSource = self
        tableView2.delegate = self
        self.tableView2.isEditing = true
        tableView2.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
     func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.sampleData1[sourceIndexPath.row]
        sampleData1.remove(at: sourceIndexPath.row)
        sampleData1.insert(movedObject, at: destinationIndexPath.row)
    }
    
}

