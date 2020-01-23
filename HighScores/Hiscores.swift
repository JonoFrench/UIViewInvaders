//
//  Hiscores.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 18/01/2020.
//  Copyright © 2020 Jaypeeff. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import UIAlphaNumeric

class HighScore {
    
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        return CoreDataStack.moc
    }()

    
    var hiScores:[HighScores] = []
    var startPos:CGFloat = 0.0
    public var highScoreView:UIView
    public var newHighScoreView:UIView?
    var alphaStringView:[StringView] = [StringView(),StringView(),StringView()]
    var alphaChar:[Int] = [0,0,0]
    var alphaPos:Int = 0
    
    init(xPos:CGFloat,yPos:CGFloat,width:CGFloat,height:CGFloat) {
        //coreDataStack = CoreDataStack(modelName: "HighScores")
        startPos = xPos + width
        highScoreView = UIView.init(frame: CGRect(x: startPos, y: yPos, width: width, height: height))
        highScoreView.backgroundColor = UIColor(white: 1.0, alpha: 0.25)
        let alpha:UIAlphaNumeric = UIAlphaNumeric()
        let w = Int(width)
        getScores()
        let title = UIView(frame: CGRect(x: 0, y: 20, width: w, height: 60))
        title.addSubview(alpha.get(string: "HiScores", size: (title.frame.size), fcol: .orange, bcol:.green ))
        title.backgroundColor = .clear
        startPos = highScoreView.center.x
        highScoreView.addSubview(title)
        for (index,h) in hiScores.enumerated() {
            let hscore = UIView(frame: CGRect(x: 0, y: 80 + (index * 40), width: w, height: 30))
            hscore.addSubview(alpha.get(string: "\(h.initials!) \(String(format: "%06d", h.score))", size: (hscore.frame.size), fcol: .orange, bcol:.green ))
            hscore.backgroundColor = .clear
            highScoreView.addSubview(hscore)
        }
        
    }
    
    func getScores(){
        
        let fetchRequest: NSFetchRequest<HighScores> = HighScores.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: HighScores.sortByScoreKey,
                                                         ascending: false)]
        fetchRequest.fetchLimit = 10
        do {
            print("Getting scores")
            
            hiScores = try managedObjectContext.fetch(fetchRequest)

        } catch {
            fatalError("Data Fetch Error")
        }

    }
    
    func addScores(score:Int){
        
    let newHighScore:HighScores = HighScores.init(entity: NSEntityDescription.entity(forEntityName: "HighScores", in:managedObjectContext)!, insertInto: managedObjectContext)
       newHighScore.initials = getInitialsString()
        newHighScore.score = Int16(score)
        self.managedObjectContext.insert(newHighScore)
        do {
            try self.managedObjectContext.save()
        }
        catch {
            print("Error saving new score")
        }
    }
    
    func removeScores(){
        
    }
    
    func isNewHiScore(score:Int) -> Bool {
        for s in hiScores {
            if s.score < Int16(score) {
            return true
            }
        }
        return false
    }
    
    func showNewHiScore(frame:CGRect) {
        newHighScoreView = UIView.init(frame: frame)
        newHighScoreView?.backgroundColor = .clear
        let alpha:UIAlphaNumeric = UIAlphaNumeric()
        let w = Int(frame.width)
        let title = UIView(frame: CGRect(x: 0, y: 20, width: w, height: 60))
        title.addSubview(alpha.get(string: "New Hi Score", size: (title.frame.size), fcol: .orange, bcol:.green ))
        title.backgroundColor = .clear
        newHighScoreView?.addSubview(title)
        let subtitle = UIView(frame: CGRect(x: 0, y: 90, width: w, height: 40))
        subtitle.addSubview(alpha.get(string: "Enter your initials", size: (title.frame.size), fcol: .orange, bcol:.green ))
        subtitle.backgroundColor = .clear
        newHighScoreView?.addSubview(subtitle)
        
        for (index,i) in alphaChar.enumerated() {
            let xPositions = [90 - 30,(w / 2) - 30 ,w - 90 - 30] //((w / 3) * index) + 60,
            let charView = UIView(frame: CGRect(x: xPositions[index], y: 180 , width: 60, height: 60))

            alphaStringView[index] = (alpha.getCharView(char: alpha.getCharacter(pos:i),size: (charView.frame.size), fcol: .orange, bcol:.green ))
            charView.addSubview(alphaStringView[index].charView!)
            newHighScoreView?.addSubview(charView)
        }
        hilightChar()
    }
    
    func hilightChar() {
        for i in alphaStringView {
            i.charView?.layer.borderWidth = 2.0
            i.charView?.layer.borderColor = UIColor.clear.cgColor
        }
        alphaStringView[alphaPos].charView?.layer.borderColor = UIColor.red.cgColor
    }
    
    func charUp(){
        let alpha:UIAlphaNumeric = UIAlphaNumeric()
        alphaChar[alphaPos] = alpha.nextChar(pos:alphaChar[alphaPos] )
        alpha.updateChar(char: alpha.getCharacter(pos:alphaChar[alphaPos]), viewArray: alphaStringView[alphaPos].charViewArray, fcol: .orange, bcol: .green)

        
    }
    
    func charDown(){
        let alpha:UIAlphaNumeric = UIAlphaNumeric()
        alphaChar[alphaPos] = alpha.prevChar(pos:alphaChar[alphaPos] )
        alpha.updateChar(char: alpha.getCharacter(pos:alphaChar[alphaPos]), viewArray: alphaStringView[alphaPos].charViewArray, fcol: .orange, bcol: .green)

        
    }
    
    func getInitialsString() -> String {
        let alpha:UIAlphaNumeric = UIAlphaNumeric()
        return alphaChar.map({String(alpha.getCharacter(pos:$0))}).joined()
    }
    
    func animateIn(){
        UIView.animate(withDuration: 2.0, delay: 2.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.2, options: .curveEaseIn, animations: {
            if let superview = self.highScoreView.superview {
                self.highScoreView.center.x = superview.center.x
            }
        },completion:{finished in self.animateOut()})
    }
    
    func animateOut(){
        UIView.animate(withDuration: 2.0, delay: 2.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.2, options: .curveEaseIn, animations: {
            if let superview = self.highScoreView.superview {
                self.highScoreView.center.x = -superview.bounds.width
            }
        },completion:{finished in
            self.highScoreView.center.x = self.startPos
            self.animateIn()})
    }
    
    func removeHighscore(){
        highScoreView.removeFromSuperview()
    }
    
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "HighScores")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
