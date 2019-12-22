import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example4
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
//    let todoController = TodoController()
//    router.get("todos", use: todoController.index)
//    router.post("todos", use: todoController.create)
//    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    let productController = ProductController()
    router.get("products", use: productController.index)
    router.post("product", use: productController.create)
    router.delete("product", use: productController.delete)
}
