//
//  MasterViewController.swift
//  flowerDetail
//
//  Created by vara shen on 2017/6/23.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    
    var flowerData : [AnyObject] = []
    var flowerSections: [String] = []

    func createFlowerData() {
        var redFlowers: [Dictionary<String,String>] = []
        var blueFlowers: [Dictionary<String,String>] = []
        
        flowerSections = ["红花","蓝花"]
        
        redFlowers.append(["name":"Poppy","picture":"Poppy.png","url":"https://en.wikipedia.org/wiki/Poppy"])
        redFlowers.append(["name":"Tulip","picture":"Tulip.png","url":"https://en.wikipedia.org/wiki/Tulip"])
        redFlowers.append(["name":"Gerbera","picture":"Gerbera.png","url":"https://en.wikipedia.org/wiki/Gerbera"])
        redFlowers.append(["name":"Peony","picture":"Peony.png","url":"https://en.wikipedia.org/wiki/Peony"])
        redFlowers.append(["name":"Rose","picture":"Rose.png","url":"https://en.wikipedia.org/wiki/Rose"])
        redFlowers.append(["name":"Hollyhock","picture":"Hollyhock.png","url":"https://en.wikipedia.org/wiki/Hollyhock"])
        redFlowers.append(["name":"Straw Flower","picture":"Strawflower.png","url":"https://en.wikipedia.org/wiki/Peony"])
        
        blueFlowers.append(["name":"Hyacinth","picture":"Hyacinth.png","url":"https://en.wikipedia.org/wiki/Hyacinth_(flower)"])
        blueFlowers.append(["name":"Hydrangea","picture":"Hydrangea.png","url":"https://en.wikipedia.org/wiki/Hydrangea"])
        blueFlowers.append(["name":"Sea Holly","picture":"Sea Holly.png","url":"https://en.wikipedia.org/wiki/Sea_holly"])
        blueFlowers.append(["name":"Grape Hyacinth","picture":"Grape Hyacinth.png","url":"https://en.wikipedia.org/wiki/Grape_hyacinth"])
        blueFlowers.append(["name":"Phlox","picture":"Phlox.png","url":"https://en.wikipedia.org/wiki/Phlox"])
        blueFlowers.append(["name":"Pin Cushion Flower","picture":"Pincushion flower.png","url":"https://en.wikipedia.org/wiki/Scabious"])
        blueFlowers.append(["name":"Iris","picture":"Iris.png","url":"https://en.wikipedia.org/wiki/Iris_(plant)"])
        
        flowerData=[redFlowers as AnyObject,blueFlowers as AnyObject]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createFlowerData()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem=(self.flowerData[indexPath.section] as! [AnyObject])[indexPath.row]
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return flowerSections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flowerData[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return flowerSections[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flowerCell", for: indexPath)
        cell.textLabel!.text = ((flowerData[indexPath.section] as! [AnyObject])[indexPath.row] as! [String:String])["name"] as String!
        cell.detailTextLabel!.text = ((flowerData[indexPath.section] as! [AnyObject])[indexPath.row] as! [String:String])["url"] as String!
        
        cell.imageView!.image = UIImage(named: ((flowerData[indexPath.section] as! [AnyObject])[indexPath.row] as! [String:String])["picture"] as String!)!
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        //default和destructive默认都是红色，normal默认是灰色。
        let more = UITableViewRowAction(style: .normal, title: "More") { action, index in
            print("more button tapped")
        }
//        more.backgroundColor = .lightGray
        
        let favorite = UITableViewRowAction(style: .default, title: "Favorite") { action, index in
            print("favorite button tapped")
        }
//        favorite.backgroundColor = .orange
        
        let share = UITableViewRowAction(style: .destructive, title: "Share") { action, index in
            print("share button tapped")
        }
//        share.backgroundColor = .blue
        
        return [share, favorite, more]
    }

}

