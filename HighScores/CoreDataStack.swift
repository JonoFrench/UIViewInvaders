/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import CoreData


class CoreDataStack {

  private let modelName: String
  
  init(modelName: String) {
    self.modelName = modelName
    CoreDataStack.managedObjectContext = persistentContainer.viewContext
  }
  
  private lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: self.modelName)
    
    // seed data if the database does not exist
    var shouldSeedData = false
    if let url = container.persistentStoreDescriptions.first?.url {
      if !FileManager.default.fileExists(atPath: url.path) {
        shouldSeedData = true
      }
    }
    container.loadPersistentStores {
      (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Failed to create Persistent Store")
      }
    }
    if shouldSeedData {
      CoreDataStack.seedData(managedContext: container.viewContext)
    }
    return container
  }()
  
  private static var managedObjectContext: NSManagedObjectContext!
  static var moc: NSManagedObjectContext! {
    if managedObjectContext == nil {
      fatalError("Core Data Stack has not been initialized")
    }
    return managedObjectContext
  }
  
}

extension CoreDataStack {
class func seedData(managedContext: NSManagedObjectContext) {
    print("Seeding Data")
    for _ in 1...10{
        //var currentCourse = Course.init(entity: NSEntityDescription.entityForName("Course", inManagedObjectContext:mox)!, insertIntoManagedObjectContext: mox)

        let h1:HighScores = HighScores.init(entity: NSEntityDescription.entity(forEntityName: "HighScores", in:managedContext)!, insertInto: managedContext)
    h1.score = 0
    h1.initials = "JPF"
        managedContext.insert(h1)
    }
    do {
    try managedContext.save()
    } catch
    {
        print("Error seeding hiscores")
    }
}
}

