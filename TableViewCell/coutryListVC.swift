//
//  coutryListVC.swift
//  TableViewCell
//
//  Created by techmaster on 7/24/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit

class coutryListVC: UITableViewController , ExpandableHeaderViewDelegate{
    var dicdata: NSArray!
    var arraykeys = [String]()
    var dicCountry = NSMutableDictionary()
    var status : Bool = false
    var arrayAll = [[String : Bool]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createDataWithName()
    }
    func createDataWithName(){
        var path : String = ""
        path = Bundle.main.path(forResource: "data", ofType: "plist")!
        dicdata = NSArray(contentsOfFile: path)
        for i in 0 ..< dicdata.count{
            let data = dicdata[i] as! NSDictionary
            let dataPot = data.value(forKey: "continent") as! String
            arraykeys.append(dataPot)
            let dataCoutry = data.value(forKey: "countries") as! NSArray
            dicCountry.setValue(dataCoutry, forKey: dataPot)
            let dic = [dataPot: false]
            self.arrayAll.append(dic)
            //          for j in 0 ..< lan2.count {
            //                let nuoc = lan2[j] as! NSDictionary
            //                let tenNuoc = nuoc.value(forKey: "coutry") as! String
            //                arraykeys.append(tenNuoc)
            //                arrayvalue.append(tenNuoc)
            //            }
            //            objectsArray.append(Objects(sectionName: giaTri,sectionObjects: arrayvalue))
            //
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return arraykeys.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectiontitle = arraykeys[section]
        let sectionObject = dicCountry.object(forKey: sectiontitle) as! NSArray
        return sectionObject.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        }
        let sectionTitle = arraykeys[indexPath.section]
        let sectionValueCountry = dicCountry[sectionTitle] as! NSArray
        let coutryObject = sectionValueCountry[indexPath.row] as! NSDictionary
        cell.textLabel?.text = coutryObject.value(forKey: "coutry") as! String?
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arraykeys[section]
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.orange
        let header : UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        //        print(All_Array[section])
        //        print()
        arrayAll[section][arraykeys[section]] = !arrayAll[section][arraykeys[section]]!
        
        tableView.beginUpdates()
        let sectionTitle = arraykeys[section]
        let sectionValueCountry = dicCountry[sectionTitle] as! NSArray
        
        for i in 0 ..< sectionValueCountry.count{
            
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
        
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: arraykeys[section], section: section, delegate: self)
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arrayAll[indexPath.section][arraykeys[indexPath.section]] == true {
            return 44
        }else{
            return 0
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowDetail"){
            let detail = segue.destination as! DetailVC
            let selectedRowIndex: NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
            let sectionTitle = arraykeys[selectedRowIndex.section]
            let sectionValueCountry = dicCountry[sectionTitle] as! NSArray
            let countryObject = sectionValueCountry[selectedRowIndex.row] as! NSDictionary
            detail.dicCountry = countryObject as! NSMutableDictionary
        }
    }
}
