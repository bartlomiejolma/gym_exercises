//
//  ViewController.swift
//  GymExercises
//
//  Created by Bartlomiej Olma on 25/09/2017.
//  Copyright © 2017 Bartlomiej Olma. All rights reserved.
//

import UIKit
import os.log


class ExerciseViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastTrainedValueLabel: UILabel!
    
    @IBOutlet weak var weightValueStepper: UIStepper!
    @IBOutlet weak var weightValueTextField: UITextField!
    @IBOutlet weak var addNewTrainingButton: UIButton!
    
    var exercise: Exercise?
    
    //MARK: Actions
    @IBAction func addNewTraining(_ sender: UIButton) {
    }
    @IBAction func changedWeight(_ sender: UIStepper) {
        if var exercise = exercise {
            exercise.weight = sender.value
            weightValueTextField.text = String(exercise.weight)
        }
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if var exercise = exercise {
            if textField == weightValueTextField {
                if let text = textField.text {
                    if let weight = Double(text){
                        exercise.weight = weight
                        weightValueStepper.value = weight
                    }
                    else {
                        textField.text = String(exercise.weight)
                    }
                }
                else {
                    textField.text = String(exercise.weight)
                }
            }
            else if textField == nameTextField{
                if let text = textField.text {
                    exercise.name = text
                }
                
            }
        }
    }

    
    //MARK: Navigation
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var exercise = exercise {
            exercise.lastTrained = Date()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weightValueTextField.delegate = self
        nameTextField.delegate = self
        
        if let exercise = exercise {

            
        }
        else
        {
            self.exercise = Exercise(name:"New Exercise Name", photo: nil, weight: 0.0, lastTrained: Date(), step: 2.5)
        }
        nameTextField.text = exercise!.name
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EE dd.MM"
        
        lastTrainedValueLabel.text =  formatter.string(from: exercise!.lastTrained)
        
        weightValueTextField.text = String(exercise!.weight)
        
        weightValueStepper.value = exercise!.weight
        weightValueStepper.maximumValue = 300.0
        weightValueStepper.minimumValue = 0.0
        weightValueStepper.stepValue = exercise!.step
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

