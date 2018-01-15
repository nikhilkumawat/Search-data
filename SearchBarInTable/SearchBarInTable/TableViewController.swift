//
//  TableViewController.swift
//  SearchBarInTable
//
//  Created by SCL IT on 15/01/18.
//  Copyright © 2018 Nikhil. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchResultsUpdating {

    var array = ["One", "Two", "Three", "Four", "Five", "Six"]
    var filteredArray = [String]()
    var searchController = UISearchController()
    var resultsController = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: resultsController)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        
        resultsController.tableView.delegate = self
        resultsController.tableView.dataSource = self
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredArray = array.filter({(array:String) -> Bool in
            if array.contains(searchController.searchBar.text!){
                return true
            } else{
                return false
            }
        })
        
        resultsController.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView ==  resultsController.tableView{
            return filteredArray.count
        }
        else{
            return array.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if tableView == resultsController.tableView{
            cell.textLabel?.text = filteredArray[indexPath.row]
        } else{
            cell.textLabel?.text = array[indexPath.row]
        }
        return cell
    }

}
