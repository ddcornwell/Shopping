//
//  ShoppingTableViewController.swift
//  Shopping
//
//  Created by DANIEL CORNWELL on 2/10/17.
//  Copyright © 2017 DANIEL CORNWELL. All rights reserved.
//

import UIKit
import CoreData

class ShoppingTableViewController: UITableViewController, ListTableViewCellDelegate {
    
    
    // MARK: - TableView
    
    
    //how many are your shopping cart
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListController.share.lists.count
    }
    
    //ok need to get your texttableviewcell and its an optional...
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ListTableViewCell else {return UITableViewCell()}
        let list = ListController.share.lists[indexPath.row]
        cell.delegate = self
        cell.list = list
        
        
        return cell
    }
    
    
    //Add button tapped needs a alertcontroller add textfield
    @IBAction func addListButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Shopping List", message: "What would you like to add to your shopping list", preferredStyle: .alert)
        //free text box
        var listTextField: UITextField?
        //add textBox
        alertController.addTextField { (textField) in
            listTextField = textField
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let AddAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let yourAddToList = listTextField?.text else {return}
            ListController.share.add(title: yourAddToList)
            self.tableView.reloadData()
        }
        
        //add your alertActions
        alertController.addAction(AddAction)
        alertController.addAction(cancelAction)
        
        //present every thing...
        self.present(alertController, animated: true, completion: nil)
    }

    
    // use toggleBuddy
    func toggleButtonOnOff(sender: ListTableViewCell) {
        guard let list = sender.list, let indexPath = tableView.indexPath(for: sender) else {return}
        ListController.share.toggleBuddy(list: list)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    // Delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let delete = ListController.share.lists[indexPath.row]
            ListController.share.delete(list: delete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}

//extension ShoppingTableViewController {
//    
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        guard let sectionInfo = ListController.share.fetchedResultsController.sections,
//            let index = Int(sectionInfo[section].) else {return nil}
//        
//        if index == 0 {
//            return "Incomplete Tasks"
//        } else {
//            return "Complete Tasks"
//        }
//    }
//    
//    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        tableView.beginUpdates()
//    }
//    
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
//        switch type {
//        case .delete:
//            guard let indexPath = indexPath else {return}
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        case .insert:
//            guard let newIndexPath = newIndexPath else {return}
//            tableView.insertRows(at: [newIndexPath], with: .automatic)
//        case .move:
//            guard let indexPath = indexPath,
//                let newIndexPath = newIndexPath else {return}
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            tableView.insertRows(at: [newIndexPath], with: .automatic)
//        case .update:
//            guard let indexPath = indexPath else {return}
//            tableView.reloadRows(at: [indexPath], with: .automatic)
//        }
//    }
//    
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
//        switch type {
//        case .delete:
//            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .automatic)
//        case .insert:
//            tableView.insertSections(IndexSet(integer: sectionIndex), with: .automatic)
//        default:
//            break
//        }
//    }
//    
//    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        tableView.endUpdates()
//    }
//    
//}





