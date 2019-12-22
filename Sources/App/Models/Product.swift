import FluentSQLite
import Vapor

/// A single entry of a Todo list.
final class Product: SQLiteModel {
    /// The unique identifier for this `Product`.
    var id: Int?

    /// A title describing what this `Product` entails.
    var name: String
    
    var price: Double
    
    var url: String
    
    var categories: [String]
    
    /// Creates a new `Product`.
    init(id: Int? = nil, name: String, price: Double, url: String, categories: [String]) {
        self.id = id
        self.name = name
        self.price = price
        self.url = url
        self.categories = categories
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension Product: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Product: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Product: Parameter { }
