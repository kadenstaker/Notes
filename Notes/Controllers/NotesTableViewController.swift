//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Kaden Staker on 8/24/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {



    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Show text to the user's view when ther save button is tapped
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteItemController.shared.note.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        // Access the index path from the item controller
        let noteItem = NoteItemController.shared.note[indexPath.row]
        // Move the detail text into the cenn
        cell.textLabel?.text = noteItem.bodyText
        

        return cell
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       
        let noteItem = NoteItemController.shared.note[indexPath.row]
        NoteItemController.shared.delete(noteItem: noteItem)
        
        tableView.deleteRows(at: [indexPath], with: .fade)
    }



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Check segue identifier
        if segue.identifier == "toDetailVC" {
        // Get destination as your VC class
        let destinationVC = segue.destination as? DetailNotesViewController
        // Get indexpath for whatever row the user selected
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        // Get object from your source of truth by indexing from the indexpath from just barely
        let noteItem = NoteItemController.shared.note[indexPath.row]
        // Create landing pad in detailVC class
            // Done
        // Pass info to the landing pad
        destinationVC?.noteItem = noteItem
        }
    }
}
