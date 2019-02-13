//
//  ViewController.swift
//  CustomSectionHeader
//
//  Created by Onur Tuna on 12.02.2019.
//  Copyright © 2019 onurtuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var customTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // I don't want user interaction
        self.customTableView.allowsSelection = false
        // The below line is to eliminate the empty cells
        self.customTableView.tableFooterView = UIView()
        // You know them 😉
        self.customTableView.dataSource = self
        self.customTableView.delegate = self
        
        let nib = UINib(nibName: "CustomSectionHeader", bundle: nil)
        customTableView.register(nib, forHeaderFooterViewReuseIdentifier: "customSectionHeader")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = "Title"
        let subtitle = "Sub title"
        
        // Dequeue with the reuse identifier
        let header = self.customTableView.dequeueReusableHeaderFooterView(withIdentifier: "customSectionHeader") as! CustomSectionHeader
        header.titleLabel.text = title
        header.subtitleLabel.text = subtitle
        
        return header
    }
    
    // Give a height to our table view cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // We have only one section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // One cell is enough
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Cell creation
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

