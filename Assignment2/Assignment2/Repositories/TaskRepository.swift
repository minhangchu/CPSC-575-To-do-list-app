//
//  TaskRepository.swift
//  Assignment2
//
//  Created by user180010 on 9/22/20.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepository: ObservableObject{
    
    let db = Firestore.firestore()
    
    @Published var tasks = [Task]()
    
    init(){
        loadData()
    }
    
    func loadData(){
        let userId = Auth.auth().currentUser?.uid
        db.collection("tasks")
            .order(by: "createdTime")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap{ document in
                    do {
                        let x = try? document.data(as: Task.self)
                        return x
                    }
                    catch {
                        print (error)
                    }
                    return nil
                }
            }
            
        }
    }
    
    
    func addTask(_ task: Task){
        do {
            var  addedtask = task
            addedtask.userId = Auth.auth().currentUser?.uid
            let _ = try db.collection("tasks").addDocument(from: addedtask)
        }
        catch{
            fatalError("Unable to encod task: \(error.localizedDescription)")
        }
    }
    
    func updateTask(_ task: Task){
        if let taskID = task.id{
            do{
                var addedTask = task
                addedTask.userId = Auth.auth().currentUser?.uid
                try db.collection("tasks").document(taskID).setData(from: addedTask)
            }
            catch {
                fatalError("Unable to encode task: \(error.localizedDescription)")
            }
        }
    }
}
