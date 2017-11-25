//
//  ExercisesDb.swift
//  GymExercises
//
//  Created by Bartlomiej Olma on 15/11/2017.
//  Copyright © 2017 Bartlomiej Olma. All rights reserved.
//

import UIKit

import SQLite

class ExercisesDb {
    
    var exercises = [Exercise]()
    
    private let db: Connection?
    
    private let tblExercises = Table("exercises")
    private let id = Expression<Int64>("id")
    private let name = Expression<String>("name")
    private let weight = Expression<Double>("weight")
    private let lastTrained = Expression<Date>("lastTrained")
    private let step = Expression<Double>("step")
    
    init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
            db = try Connection("\(path)/exercises.sqlite3")
            createTableExercises()
            loadSampleExercises()
        } catch {
            db = nil
            print ("Unable to open database")
        }
        
    }
    
    private func createTableExercises() {
        do {
            try db!.run(tblExercises.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(name, unique: true)
                table.column(weight)
                table.column(lastTrained)
                table.column(step)
            })
            print("create table successfully")
        } catch {
            print("Unable to create table")
        }
    }
    
    func addExercise(_ exercise: Exercise) -> Int64? {
        do {
            let insert = tblExercises.insert(name <- exercise.name, lastTrained <- exercise.lastTrained, weight <- exercise.weight, step <- exercise.step)
            let id = try db!.run(insert)
            print("Insert to tblExercises successfully")
            return id
        } catch {
            print("Cannot insert to database")
            return nil
        }
    }
    
    private func loadSampleExercises() {
        
    }
    
    func readDb(){
        
        do{
            if let dataRows = try db?.prepare(tblExercises){
                print(Array(dataRows))
            } else {
                print("else")
            }
        } catch {
            print("error \(error)")
        }
        
    }
    subscript(index: Int) -> Exercise
    {
        get
        {
            let selectSpecificExerciseQuerry = tblExercises.where(id==Int64(index + 1))

            do {
                if let selectedExercise = try db?.pluck(selectSpecificExerciseQuerry){
                    return Exercise(
                        name: selectedExercise[name],
                        photo: nil,
                        weight: selectedExercise[weight],
                        lastTrained: selectedExercise[lastTrained],
                        step: selectedExercise[step])
                }
                else
                {
                    print ("No entity matching row number")
                }
            } catch {
                print(error)
            }
            
            return Exercise(
                name: "",
                photo: nil,
                weight: 0,
                lastTrained: Date(),
                step: 0)

        }
        set
        {
            let selectSpecificExerciseQuerry = tblExercises.where(id==Int64(index + 1))

            do {
                try db?.run(selectSpecificExerciseQuerry.update(weight <- newValue.weight,
                                                                lastTrained <- newValue.lastTrained, name <- newValue.name))
            } catch {
                print(error)
            }
            
        }
    }
    
    
    public func count() -> Int
    {
        do {
            if let count = try db?.scalar(tblExercises.count)
            {
                return count
            }
            else
            {
                return 0
            }
        } catch {
            print(error)
            return 0
        }
    }

}
