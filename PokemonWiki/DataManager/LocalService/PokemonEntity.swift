//
//  UserEntity.swift
//  PokemonWiki
//
//  Created by murphy on 22.11.2023.
//

import Foundation
import CoreData

class PokemonEntity: NSManagedObject {
    static func findOrCreate(_ pokemon: Pokemon, context: NSManagedObjectContext) throws -> PokemonEntity {
        
        let request = PokemonEntity.fetchRequest()
        if pokemon.name == "bulbasaur" {
            
        }
        request.predicate = NSPredicate(format: "name == %@", pokemon.name)
        do {
            let fetchResult = try context.fetch(request)
            if fetchResult.count > 0 {
                assert(fetchResult.count == 1, "Duplicate has been found in DB")
                return fetchResult[0]
            }
        } catch {
            throw error
        }
        let pokemonEntity = PokemonEntity(with: pokemon, context: context)
        return pokemonEntity
    }
    
    static func all(_ context: NSManagedObjectContext) throws -> [PokemonEntity] {
        let request: NSFetchRequest<PokemonEntity> = PokemonEntity.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            throw error
        }
    }
    
    convenience init(with pokemon: Pokemon, context: NSManagedObjectContext) {
        self.init(context: context)
        name = pokemon.name
        height = Int64(pokemon.height)
        weight = Int64(pokemon.weight)
        image = pokemon.image
        types = pokemon.types.map { $0.rawValue }.joined(separator: ",")
    }
}
