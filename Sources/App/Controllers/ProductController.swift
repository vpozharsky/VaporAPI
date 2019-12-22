import Vapor

/// Controls basic CRUD operations on `Product`s.
final class ProductController {
    /// Returns a list of all `Product`s.
    func index(_ req: Request) throws -> Future<[Product]> {
        let price = req.query[Double.self, at: "price"]
        let categories = req.query[[String].self, at: "categories"]
        let name = req.query[String.self, at: "name"]
        
        
//        return Product.query(on: req).filter(\Product.name == "asd")
        return Product.query(on: req).all()
    }

    /// Saves a decoded `Product` to the database.
    func create(_ req: Request) throws -> Future<Product> {
        return try req.content.decode(Product.self).flatMap { product in
            return product.save(on: req)
        }
    }

    /// Deletes a parameterized `Product`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Product.self).flatMap { product in
            return product.delete(on: req)
        }.transform(to: .ok)
    }
}
