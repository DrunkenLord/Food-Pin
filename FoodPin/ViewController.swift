//
//  ViewController.swift
//  FoodPin
//
//  Created by Mehul  Singhal  on 22/05/17.
//  Copyright © 2017 Mehul  Singhal . All rights reserved.
//

import UIKit

var restaurantIsVisited = Array(repeating: false, count: 21)


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional",
                           "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]

    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg",
                            "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg",
                            "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg",
                            "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg",
                            "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg",
                            "donostia.jpg", "royaloak.jpg", "restaurant.jpg"]
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong",
    "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York",
    "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
//    var restaurantIsVisited = Array(repeating: false, count: 21)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantTableViewCell
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        cell.thumbnailImageView.layer.cornerRadius = 30
        cell.thumbnailImageView.clipsToBounds = true
        if restaurantIsVisited[indexPath.row]
        {
            cell.accessoryType = .checkmark
        }
        else{
            cell.accessoryType = .none
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override var prefersStatusBarHidden: Bool
        {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete
        {
            restaurantNames.remove(at: indexPath.row)
            restaurantIsVisited.remove(at: indexPath.row)
            restaurantTypes.remove(at: indexPath.row)
            restaurantLocations.remove(at: indexPath.row)
            restaurantImages.remove(at: indexPath.row)

        }
        tableView.deleteRows(at: [indexPath], with: .left)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Social sharing function 
        let shareAction = UITableViewRowAction(style:UITableViewRowActionStyle.normal, title: "Share" ,handler: { (action, indexPath) -> Void in
            let defaultText = "Just checking in at" + self.restaurantNames[indexPath.row]
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row])
            {
            let activityViewController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            
            self.present(activityViewController, animated: true, completion: nil)
            }})
        
        //Delete button 
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete", handler: { (actioh, indexPath) -> Void in
            
            self.restaurantNames.remove(at: indexPath.row)
            restaurantIsVisited.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        })
        
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        return [deleteAction, shareAction]
    }
    
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        //Create an option menu as an actionSheet
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//        //Add actions to the menu 
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//        //Display the menu
//        present(optionMenu, animated: true, completion: nil)
//        //adding some options to the action sheet
//        // the whole thing inside the braces is known as the closure. Yeah bitch Harvey specter style :p
//        let callActionHandler = { (action: UIAlertAction) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry. The call feature is not available right now. Please try agian later.", preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//        
//        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//        
//        var checkTitle: String
//        if restaurantIsVisited[indexPath.row] == true{
//            checkTitle = "Undo Check"
//        }
//        else{
//            checkTitle = "Check In"
//        }
//        let checkAction = UIAlertAction(title: checkTitle, style: .default, handler:{
//            (action:UIAlertAction) -> Void in
//            
//            let cell = tableView.cellForRow(at: indexPath)
//            if checkTitle == "Check In"
//            {
//                cell?.accessoryType = .checkmark
//                self.restaurantIsVisited[indexPath.row] = true
//            }
//            else
//            {
//                cell?.accessoryType = .none
//                self.restaurantIsVisited[indexPath.row] = false
//            }
//            
//        })
//        //Different way to implement the code 
//        /*
//         let checkInTitle = restaurantIsVisited[indexPath.row] ? "Undo Check in" : "Check in"
//         let checkInAction = UIAlertAction(title: checkInTitle, style: .default, handler: {
//         (action:UIAlertAction!) -> Void in
//         
//         let cell = tableView.cellForRow(at: indexPath)
//         
//         // Toggle check-in and undo-check-in
//         self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
//         cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
//         */
//        optionMenu.addAction(checkAction)
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail"
        {
            if let indexPath = tableView.indexPathForSelectedRow{
            let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.imageOfRestaurant = restaurantImages[indexPath.row]
                destinationController.nameOfRestaurant = restaurantNames[indexPath.row]
                destinationController.locationOfRestaurant = restaurantLocations[indexPath.row]
                destinationController.typeOfRestaurant = restaurantTypes[indexPath.row]
                destinationController.rowNumber = indexPath.row
                destinationController.cellNumber = tableView.cellForRow(at: indexPath)
            }
        }
    }


}

