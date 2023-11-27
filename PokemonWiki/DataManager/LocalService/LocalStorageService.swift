//
//  LocalStorageService.swift
//  PokemonWiki
//
//  Created by murphy on 22.11.2023.
//

import Foundation
import CoreData

class LocalStorageService {
    static let shared = LocalStorageService()
    
    private lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PokemonWiki")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
                print("data saved successfully")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
   
    func isExist(pokemon: Pokemon) throws -> Bool {
        let request = PokemonEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %ld", pokemon.id)
        do {
            let fetchResult = try context.fetch(request)
            if fetchResult.count > 0 {
                return true
            } else{
                return false
            }
        } catch {
            throw error
        }
    }
    
    func findOrCreate(pokemon: Pokemon, image: Data?) throws -> PokemonEntity {
        let request = PokemonEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %ld", pokemon.id)
        do {
            let fetchResult = try context.fetch(request)
            if fetchResult.count > 0 {
                assert(fetchResult.count == 1, "Duplicate has been found")
                return fetchResult[0]
            }
        } catch {
            throw error
        }
        let pokemonEntity = PokemonEntity(with: pokemon, image: image, context: context)
        return pokemonEntity
    }
    
    func getAll() async throws -> [PokemonEntity] {
        let request: NSFetchRequest<PokemonEntity> = PokemonEntity.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            throw error
        }
    }
}
