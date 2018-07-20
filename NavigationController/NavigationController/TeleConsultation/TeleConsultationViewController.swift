//
//  TeleconsulationViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 26/04/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit
import Material


class TeleConsultationViewController: UIViewController {
    
    fileprivate let consultation = ConsultationViewController()
    fileprivate let healthAdviceController = HealthAdviceViewController()
    fileprivate let myReportReViewController = MyReportReViewController()
    fileprivate let secondOpinionController = SecondOpinionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        prepareNavigationItem()
        teleConsultation()
        healthAdvice()
        medicalReportView()
        secondOpinion()
    }
    
}
extension TeleConsultationViewController {
    
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "TeleConsultation"
    }
    fileprivate func teleConsultation() {
        let button = RaisedButton(title: "Consultation", titleColor: .black)
        button.pulseColor = .cyan
        button.backgroundColor = Color.grey.lighten3
        button.borderColor = Color.green.darken1
        button.borderWidthPreset = BorderWidthPreset(rawValue: Int(2.0))!
        button.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(4.0))!
        view.layout(button).width(250).height(100).left(75).top(40)
        button.addTarget(self, action: #selector(myConsultationClick), for: .touchUpInside)
        self.view.addSubview(button)
    }
    fileprivate func healthAdvice() {
        let button = RaisedButton(title: "Health Advice", titleColor: .black)
        button.pulseColor = .cyan
        button.backgroundColor = Color.grey.lighten3
        button.borderColor = Color.green.darken1
        button.borderWidthPreset = BorderWidthPreset(rawValue: Int(2.0))!
        button.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(4.0))!
        let scrHeight: CGFloat = screenHeight / 4
        view.layout(button).width(251).height(100).left(75).top(CGFloat(scrHeight))
        button.addTarget(self, action: #selector(myHealthAdviceClick), for: .touchUpInside)
        self.view.addSubview(button)
    }
    fileprivate func medicalReportView() {
        let button = RaisedButton(title: "Medical Report Review", titleColor: .black)
        button.pulseColor = .cyan
        button.backgroundColor = Color.grey.lighten3
        button.borderColor = Color.green.darken1
        button.borderWidthPreset = BorderWidthPreset(rawValue: Int(2.0))!
        button.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(4.0))!
        let scrHeight: CGFloat = screenHeight / 3
        view.layout(button).width(250).height(100).left(75).top(CGFloat(scrHeight + 80 ))
        button.addTarget(self, action: #selector(myMedicalReview), for: .touchUpInside)
        self.view.addSubview(button)
    }
    fileprivate func secondOpinion() {
        let button = RaisedButton(title: "Second Opinion", titleColor: .black)
        button.pulseColor = .cyan
        button.backgroundColor = Color.grey.lighten3
        button.borderColor = Color.green.darken1
        button.borderWidthPreset = BorderWidthPreset(rawValue: Int(2.0))!
        button.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(4.0))!
        let scrHeight: CGFloat = screenHeight / 2
        view.layout(button).width(250).height(100).left(75).top(CGFloat(scrHeight + 100))
        button.addTarget(self, action: #selector(secondOpinionClick), for: .touchUpInside)
        self.view.addSubview(button)
    }
    @objc
    func myConsultationClick() {
        print("Consultation")
        navigationController?.pushViewController(consultation, animated: true)
    }
    @objc
    func myHealthAdviceClick() {
        print("Health Advice")
        navigationController?.pushViewController(healthAdviceController, animated: true)
    }
    @objc
    func myMedicalReview() {
        print("My Report ReView")
        navigationController?.pushViewController(myReportReViewController, animated: true)
    }
    @objc
    func secondOpinionClick() {
        print("Second Opinion")
        navigationController?.pushViewController(secondOpinionController, animated: true)
    }
}
