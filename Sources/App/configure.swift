import Vapor
import Leaf
import Fluent
import FluentMySQLDriver

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
	let fileMiddleware = FileMiddleware(
		publicDirectory: app.directory.publicDirectory
	)
	app.views.use(.leaf)
	app.middleware.use(fileMiddleware)
//	app.databases.use(.mysql(hostname: "localhost", username: "root", password: "airport", database: "BooksApp"), as: .mysql)
	configureDatabase(app: app)
	app.migrations.add(Author.Create())
	app.migrations.add(Author.AddBio())
	app.migrations.add(Author.MakeNameUnique())
	app.migrations.add(Author.Seed())
	app.migrations.add(Address.Create())
	app.migrations.add(Editor.Create())
	app.migrations.add(Address.AddEditorIdUnique())
	app.migrations.add(Editor.Seed())
	app.migrations.add(Address.Seed())
	app.migrations.add(Category.Create())
	app.migrations.add(Category.Seed())
	app.migrations.add(Book.Create())
	app.migrations.add(BookCategoryPivot.Create())
	app.logger.logLevel = .debug

//
    // register routes
    try routes(app)
}

func configureDatabase(app: Application) {
//	let host = Environment.get("localhost") ?? ""
//	let port = Environment.get("8080").flatMap(Int.init) ?? 3306
//	let user = Environment.get("root") ?? ""
//	let pass = Environment.get("airport") ?? ""
//	let name = Environment.get("BooksApp") ?? ""
//
//	app.databases.use(.mysql(hostname: host, port: port, username: user, password: pass, database: name, tlsConfiguration: .forClient(certificateVerification: .none)), as: .mysql)
	var tls = TLSConfiguration.makeClientConfiguration()
	tls.certificateVerification = .none
	
	app.databases.use(.mysql(
		hostname: "127.0.0.1",
		port: 3306,
		username: "root",
		password: "airport",
		database: "BooksApp",
		tlsConfiguration: tls
	), as: .mysql)
}
