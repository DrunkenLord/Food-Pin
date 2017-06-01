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
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image = UIImage(named: imageOfRestaurant)
//        nameLabel.text = nameOfRestaurant
//        locationLabel.text = locationOfRestaurant
//        typeLabel.text = typeOfRestaurant
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
