//
//  MyPetAddViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 27/04/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit
import Material

class MyPetAddViewController: UIViewController {
    
    var customSeg = UISegmentedControl (items: ["Male","Female"])
    
    var customlabel : UILabel = UILabel()
    
    fileprivate var petName : TextField!
    fileprivate var typeOfPet : TextField!
    
    fileprivate var breedName : TextField!
    fileprivate var dateOfBirth : TextField!
    fileprivate var heightPet : TextField!
    fileprivate var weightPet : TextField!
    fileprivate var selectHeight : TextField!
    
    let v1 = UIView()
    let buttons = UIButton(type: .custom)
    
    let imageName = "labro.jpg"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        
        customSeg.frame = CGRect(x: 20, y: screenHeight / 2 + 70, width: screenWidth - 40, height: 30)
        customSeg.selectedSegmentIndex = 1
        customSeg.tintColor = UIColor.blue
        //        customSegmentedControl.addTarget(self, action: "segmentedValueChanged:", forControlEvents: .ValueChanged)
        self.view.addSubview(customSeg)
        
        customlabel.frame = CGRect(x: 20, y: screenHeight / 2 + 45, width: screenWidth - 15, height: 30)
        customlabel.textColor = UIColor.black
        customlabel.text = "Gender"
        self.view.addSubview(customlabel)
        
        
        buttons.frame = CGRect(x: screenWidth / 2 + 95, y: screenHeight / 2 - 180, width: 50, height: 50)
        buttons.layer.cornerRadius = 0.5 * buttons.bounds.size.width
        buttons.clipsToBounds = true
        //        buttons.addTarget(self, action: #selector(petClick), for: .touchUpInside)
        //        buttons.setImage(UIImage(named: "plus.png"), for: .normal)
        buttons.setImage(Icon.cm.photoCamera?.crop(toWidth: 30, toHeight: 20), for: .normal)
        view.addSubview(buttons)
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: screenWidth / 2 - 100, y: 10, width: screenWidth / 2, height: 200)
        view.addSubview(imageView)
        
        PetNames()
        TypeOfPets()
        BreedNames()
        DateofBirth()
        heightofPet()
        weightofPet()
        SelectHeight()
        AddMember()
    }
    
    
}

extension MyPetAddViewController {
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "Add Pet"
    }
    fileprivate func PetNames() {
        petName = TextField()
        petName.placeholder = "Pet Name"
        petName.clearButtonMode = .whileEditing
        petName.dividerNormalColor = Color.cyan.base
        petName.placeholderActiveColor = Color.cyan.base
        petName.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(petName).top(screenHeight / 2 - 158).left(20).right(20)
        //        self.view.addSubview(insuranceName)
    }
    fileprivate func TypeOfPets() {
        typeOfPet = TextField()
        typeOfPet.placeholder = "Type of Pet"
        typeOfPet.clearButtonMode = .whileEditing
        typeOfPet.dividerNormalColor = Color.cyan.base
        typeOfPet.placeholderActiveColor = Color.cyan.base
        typeOfPet.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(typeOfPet).top(screenHeight / 2 - 100).left(20).right(20)
        //        self.view.addSubview(insuranceName)
    }
    fileprivate func BreedNames() {
        breedName = TextField()
        breedName.placeholder = "Breed Name"
        breedName.clearButtonMode = .whileEditing
        breedName.dividerNormalColor = Color.cyan.base
        breedName.placeholderActiveColor = Color.cyan.base
        breedName.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(breedName).top(screenHeight / 2 - 43).left(20).right(20)
        //        self.view.addSubview(insuranceName)
    }
    fileprivate func DateofBirth() {
        dateOfBirth = TextField()
        dateOfBirth.placeholder = "Date of Birth"
        dateOfBirth.clearButtonMode = .whileEditing
        dateOfBirth.dividerNormalColor = Color.cyan.base
        dateOfBirth.placeholderActiveColor = Color.cyan.base
        dateOfBirth.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(dateOfBirth).top(screenHeight / 2 + 20).left(20).right(20)
        //        self.view.addSubview(insuranceName)
    }
    fileprivate func weightofPet() {
        weightPet = TextField()
        weightPet.placeholder = "Weight(kg)"
        weightPet.clearButtonMode = .whileEditing
        weightPet.dividerNormalColor = Color.cyan.base
        weightPet.placeholderActiveColor = Color.cyan.base
        weightPet.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(weightPet).top(screenHeight / 2 + 128).left(20).right(20)
        //        self.view.addSubview(insuranceName)
    }
    fileprivate func heightofPet() {
        heightPet = TextField()
        heightPet.placeholder = "Height"
        heightPet.clearButtonMode = .whileEditing
        heightPet.dividerNormalColor = Color.cyan.base
        heightPet.placeholderActiveColor = Color.cyan.base
        heightPet.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(heightPet).top(screenHeight / 2 + 188).left(20).right(screenWidth / 2 - 20)
        //        self.view.addSubview(insuranceName)
    }
    fileprivate func SelectHeight() {
        selectHeight = TextField()
        selectHeight.placeholder = "Select"
        selectHeight.clearButtonMode = .whileEditing
        selectHeight.dividerNormalColor = Color.cyan.base
        selectHeight.placeholderActiveColor = Color.cyan.base
        selectHeight.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(selectHeight).top(screenHeight / 2 + 188).left(screenWidth / 2 - 29).right(20)
        //        self.view.addSubview(insuranceName)
    }
    
    fileprivate func AddMember() {
        let button = RaisedButton(title: "Add Member", titleColor: .white)
        button.pulseColor = .white
        button.backgroundColor = Color.cyan.base
//        view.layout(button).bottomRight(bottom: 20, right: 20)
        view.layout(button).bottom(20).left(20).right(20)
        //        view.layout(button).bottom().center(offsetX: 10, offsetY: -uiText.bounds.height + 100)
        //        view.layout(button).center(offsetY: -uiText.bounds.height + screenHeight - 80).left(20).right(20)
        //        view.layout(button).center(offsetY: -uiText.bounds.height + screenHeight + 180).left(20).right(20)
        
        button.setTitle("Add Member", for: .normal)
        //        button.addTarget(self, action: #selector(consultation1), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    
}

