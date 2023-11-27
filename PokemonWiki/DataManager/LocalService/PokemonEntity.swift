//
//  UserEntity.swift
//  PokemonWiki
//
//  Created by murphy on 22.11.2023.
//

import Foundation
import CoreData

class PokemonEntity: NSManagedObject {

    @NSManaged public var id: Int64
    @NSManaged public var height: Int64
    @NSManaged public var image: Data?
    @NSManaged public var imageURL: String
    @NSManaged public var name: String
    @NSManaged public var types: String
    @NSManaged public var weight: Int64
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokemonEntity> {
        return NSFetchRequest<PokemonEntity>(entityName: "PokemonEntity")
    }
    
    init(with pokemon: Pokemon, image: Data?, context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "PokemonEntity", in: context)!
        super.init(entity: entity, insertInto: context)
        self.id = Int64(pokemon.id)
        self.height = Int64(pokemon.height)
        self.image = image
        self.imageURL = pokemon.imageURL
        self.name = pokemon.name
        self.types = pokemon.types.map { $0.rawValue }.joined(separator: ",")
        self.weight = Int64(pokemon.weight)
    }
    
    private override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    @available(*, unavailable)
    public init() {
        fatalError()
    }
    
    @available(*, unavailable)
    public init(context: NSManagedObjectContext) {
        fatalError()
    }
}
