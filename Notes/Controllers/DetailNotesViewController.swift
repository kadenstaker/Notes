//
//  DetailViewController.swift
//  Notes
//
//  Created by Kaden Staker on 8/24/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class DetailNotesViewController: UIViewController {

    // Segue landing pad
    var noteItem: NoteItem?
    
    @IBOutlet weak var bodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    func updateViews() {
        guard let noteItem = noteItem else {return}
        
        bodyTextView?.text = noteItem.bodyText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard bodyTextView.text != nil else {return}
        
        // Get access to note item
        // this function must return true or else the guard will stop the saveButtonTapped function
        guard let bodyText = bodyTextView.text else {return}
        
        if let noteItem = noteItem {
            NoteItemController.shared.update(noteItem: noteItem, newBodyText: bodyText)
        } else {
            NoteItemController.shared.create(bodyText: bodyText)
        }
        navigationController?.popViewController(animated: true)
    }
}
