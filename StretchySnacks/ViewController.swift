//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Aaron Johnson on 2017-11-09.
//  Copyright © 2017 Aaron Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: Properties / Outlets
    var foodStack:UIStackView = UIStackView()
    var snackLabelYConstraint = NSLayoutConstraint()
    var snackLabel = UILabel()
    var foodArry = Array<String>()
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var navHeightConstraint: NSLayoutConstraint!
    
    //MARK: Actions
    @IBAction func plusButton(_ sender: UIButton) {
        if self.navHeightConstraint.constant == 200{
            foodStack.isHidden = true
            UIView.animate(withDuration: 1.25, delay: 0, usingSpringWithDamping: 0.25, initialSpringVelocity: 5, options: [], animations: {
                // Values for end state of animation
                self.plusButton.transform = CGAffineTransform(rotationAngle: 0)
                self.snackLabelYConstraint.constant = 0
                self.snackLabel.text = "SNACKS"
                self.navHeightConstraint.constant = 64
                self.view.layoutIfNeeded()
            }) { (finished: Bool) in
                // Completion and cleanup
            }
        } else {
            foodStack.isHidden = false
            UIView.animate(withDuration: 1.25, delay: 0, usingSpringWithDamping: 0.25, initialSpringVelocity: 5, options: [], animations: {
                // Values for end state of animation
                self.plusButton.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 4)
                self.snackLabelYConstraint.constant = -40
                self.snackLabel.text = "Add a SNACK"
                self.navHeightConstraint.constant = 200
                self.view.layoutIfNeeded()
            }) { (finished: Bool) in
                // Completion and cleanup
            }
        }
    }

    @objc func addFood(sender: UITapGestureRecognizer){
        switch sender.view!.tag{
        case 0:
            foodArry.insert("Oreos", at: 0)
            break
        case 1:
            foodArry.insert("Pop Tart", at: 0)
            break
        case 2:
            foodArry.insert("Pizza Pocket", at: 0)
            break
        case 3:
            foodArry.insert("Popsicle", at: 0)
            break
        case 4:
            foodArry.insert("Ramen", at: 0)
            break
        default:
            return
        }
        self.myTableView.insertRows(at: [IndexPath.init(row: 0, section: 0)], with: .top)
    }
    
    //MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = foodArry[indexPath.row]
        return cell
    }
    
    //MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFoodStack()
        setupSnackLabel()
    }
    
    func setupSnackLabel(){
        snackLabel.clipsToBounds = false
        snackLabel.text = "SNACKS"
        snackLabel.translatesAutoresizingMaskIntoConstraints = false
        self.navView.addSubview(snackLabel)
        snackLabel.centerXAnchor.constraint(equalTo: self.navView.centerXAnchor).isActive = true
        snackLabelYConstraint = snackLabel.centerYAnchor.constraint(equalTo: self.navView.centerYAnchor, constant: 0)
        snackLabelYConstraint.isActive = true
    }
    
    func setupFoodStack(){
        foodStack.axis = .horizontal
        foodStack.distribution = .fillEqually
        foodStack.alignment = .center
        foodStack.spacing = 0
        foodStack.isHidden = true
        foodStack.translatesAutoresizingMaskIntoConstraints = false
        self.navView.addSubview(foodStack)
        foodStack.centerXAnchor.constraint(equalTo: self.navView.centerXAnchor).isActive = true
        foodStack.bottomAnchor.constraint(equalTo: self.navView.bottomAnchor, constant: -20).isActive = true
        foodStack.heightAnchor.constraint(equalToConstant: 64).isActive = true
        foodStack.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        let oreos = UIImageView(image: #imageLiteral(resourceName: "oreos"))
        oreos.isUserInteractionEnabled = true
        oreos.tag = 0
        oreos.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addFood)))
        foodStack.addArrangedSubview(oreos)
        
        let popTart = UIImageView(image: #imageLiteral(resourceName: "pop_tarts"))
        popTart.isUserInteractionEnabled = true
        popTart.tag = 1
        popTart.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addFood)))
        foodStack.addArrangedSubview(popTart)
        
        let popsicle = UIImageView(image: #imageLiteral(resourceName: "popsicle"))
        popsicle.isUserInteractionEnabled = true
        popsicle.tag = 2
        popsicle.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addFood)))
        foodStack.addArrangedSubview(popsicle)
        
        let pizzaPocket = UIImageView(image: #imageLiteral(resourceName: "pizza_pockets"))
        pizzaPocket.isUserInteractionEnabled = true
        pizzaPocket.tag = 3
        pizzaPocket.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addFood)))
        foodStack.addArrangedSubview(pizzaPocket)
        
        let ramen = UIImageView(image: #imageLiteral(resourceName: "ramen"))
        ramen.isUserInteractionEnabled = true
        ramen.tag = 4
        ramen.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addFood)))
        foodStack.addArrangedSubview(ramen)
    }
}

