import Vapor



func routes(_ app: Application) throws {
	
	// 1
	let bookAPIController = BookAPIController()
	let indexController = IndexController()
	
	// 1
	let apiRoutes = app.grouped("api", "v1")
	
	// 2
	try apiRoutes.grouped("books").register(collection: bookAPIController)
	
	app.get("hello") { req async throws -> View in
		return try await req.view.render("hello", ["name": "Leaf"])
	}
	
	try app.register(collection: indexController)
}
