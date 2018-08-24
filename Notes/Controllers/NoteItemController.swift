//
//  NoteController.swift
//  Notes
//
//  Created by Kaden Staker on 8/24/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import Foundation

class NoteItemController {
    
    // One shared instance
    static let shared = NoteItemController()
    
    // Source of Truth
    var note: [NoteItem] = []
    
    // CRUD
    
    // Create
    func create(bodyText: String) {
        // Create one instance of the class object
        let noteItem = NoteItem(bodyText: bodyText)
        // Append to note
        note.append(noteItem)
        // Call saveToPersistentStore (after persistence is coded)
        saveToPersistentStore()
    }
    
    // Update
    func update(noteItem: NoteItem, newBodyText: String) {
        // We just want to change properties, so
        noteItem.bodyText = newBodyText
        // Call saveToPersistentStore (after persistence is coded)
        saveToPersistentStore()
    }
    
    // Destroy
    // This function only available if we conform to equatable
    func delete(noteItem: NoteItem) {
        // Implement equatable (in NoteItem class swift file)
        // Index what we want to remove
        
        // Unwrap index with guard
        guard let index = note.index(of: noteItem) else {return}
        // Feed index into remove function
        note.remove(at: index)
        // Call saveToPersistentStore (after persistence is coded)
        saveToPersistentStore()
    }
    
    
    // MARK: - Persistence
    
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let fileName = "notes.json"
        let fullURL = documentsDirectory.appendingPathComponent(fileName)
        print(fullURL)
        return fullURL
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(note)
            print(data)
        try data.write(to: fileURL())
        } catch {
            print("Error saving to persistent store \(error) \(error.localizedDescription)")
        }
    }
    
    func loadsFromPersistentStore() -> [NoteItem] {
        do {
            let data = try Data(contentsOf: fileURL())
            let decoder = JSONDecoder()
            let noteItems = try decoder.decode([NoteItem].self, from: data)
            return noteItems
        } catch {
            print("Error loading to persistent store\(error) \(error.localizedDescription)")
        }
        return []
    }
}
