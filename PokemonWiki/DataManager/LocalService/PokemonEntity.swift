//
//  UserEntity.swift
//  PokemonWiki
//
//  Created by murphy on 22.11.2023.
//

import Foundation
import CoreData

class PokemonEntity: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokemonEntity> {
        return NSFetchRequest<PokemonEntity>(entityName: "PokemonEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var height: Int64
    @NSManaged public var image: Data?
    @NSManaged public var imageURL: String
    @NSManaged public var name: String
    @NSManaged public var types: String
    @NSManaged public var weight: Int64
    
    init(with pokemon: Pokemon, image: Data?, context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "PokemonEntity", in: context)!
        super.init(entity: entity, insertInto: context)
        if pokemon.id == 0 {print("adsfasdfasdfasdfadsfa")}
        self.id = Int64(pokemon.id)
        if self.id == 0 { print("ffffffffffffffff")}
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
//    public init(context: NSManagedObjectContext,
//                id: Int64,
//                
//                username: String,
//                lastLogin: Date? = nil,
//                verified: Bool = false) {
//        let entity = NSEntityDescription.entity(forEntityName: "Pokemon", in: context)!
//        super.init(entity: entity, insertInto: context)
//        
//        
//        
//    }

    @available(*, unavailable)
    public init() {
        fatalError()
    }
    @available(*, unavailable)
    public init(context: NSManagedObjectContext) {
        fatalError()
    }
    
//    private lazy var context: NSManagedObjectContext = {
//        return loopersistentContainer.viewContext
//    }()
//    
//    convenience init(with pokemon: Pokemon, imageData: Data, context: NSManagedObjectContext) {
//        self.init(context: context)
//        name = pokemon.name
//        height = Int64(pokemon.height)
//        weight = Int64(pokemon.weight)
//        image = imageData
//        types = pokemon.types.map { $0.rawValue }.joined(separator: ",")
//    }
}
