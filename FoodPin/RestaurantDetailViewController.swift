//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Mehul  Singhal  on 02/06/17.
//  Copyright © 2017 Mehul  Singhal . All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    @IBOutlet weak var restaurantImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    var imageOfRestaurant = ""
    var nameOfRestaurant = ""
    var locationOfRestaurant = ""
    var typeOfRestaurant = ""
    var rowNumber: Int = 0
    var cellNumber: UITableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image = UIImage(named: imageOfRestaurant)
        nameLabel.text = nameOfRestaurant
        locationLabel.text = locationOfRestaurant
        typeLabel.text = typeOfRestaurant
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionSheet(_ sender: Any) {
        
        //Create an option menu as an actionSheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        //Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        //Display the menu
        present(optionMenu, animated: true, completion: nil)
        //adding some options to the action sheet
        // the whole thing inside the braces is known as the closure. Yeah bitch Harvey specter style :p
        let callActionHandler = { (action: UIAlertAction) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry. The call feature is not available right now. Please try agian later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call" + "123-000-\(rowNumber)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        var checkTitle: String
        if restaurantIsVisited[rowNumber] == true{
            checkTitle = "Undo Check"
        }
        else{
            checkTitle = "Check In"
        }
        let checkAction = UIAlertAction(title: checkTitle, style: .default, handler:{
            (action:UIAlertAction) -> Void in
            
            let cell = self.cellNumber
            if checkTitle == "Check In"
            {
                cell?.accessoryType = .checkmark
                restaurantIsVisited[self.rowNumber] = true
            }
            else
            {
                cell?.accessoryType = .none
                restaurantIsVisited[self.rowNumber] = false
            }
            
        })
        //Different way to implement the code
        /*
         let checkInTitle = restaurantIsVisited[indexPath.row] ? "Undo Check in" : "Check in"
         let checkInAction = UIAlertAction(title: checkInTitle, style: .default, handler: {
         (action:UIAlertAction!) -> Void in
         
         let cell = tableView.cellForRow(at: indexPath)
         
         // Toggle check-in and undo-check-in
         self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
         cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
         */
        optionMenu.addAction(checkAction)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
