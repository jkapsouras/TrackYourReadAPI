	//
	//  File.swift
	//
	//
	//  Created by Ioannis Kapsouras on 18/8/23.
	//

import Vapor

final class BookAPIController {
	
		// 1
	struct Book: Content {
		let id: Int
		let title: String
		let author: String?
	}
	
		// 2
	static let books = [
		Book(id: 1, title: "Server Side Swift with Vapor", author: "raywenderlich.com"),
		Book(id: 2, title: "Server Side Swift (Vapor Edition)", author: "Hacking with Swift"),
		Book(id: 3, title: "Hands-On Swift 5 Microservices Development", author: nil)
	]
	
		// 3
	func getBooks(req: Request) -> [Book] {
		return Self.books
	}
	
	func getBook(req: Request) throws -> Book {
		guard
			// 1
			let bookIDString = req.parameters.get("bookID"),
			// 2
			let bookID = Int(bookIDString),
			// 3
			let book = Self.books.first(where: { $0.id == bookID })
		else {
				// 4
			throw Abort(.notFound)
		}
			// 5
		return book
	}
	
	func searchBookByAuthor(req: Request) throws -> [Book] {
		guard
			let name: String? = req.query["author"]
		else{
			throw Abort(.notFound)
		}
		
		let books: [Book] = Self.books.filter//{book in book.author.contains(name ?? "")}
		{
			book in
			guard let author = book.author else{return false}
			return author.contains(name ?? "")}
		
		return books
	}
}

	// 4
extension BookAPIController: RouteCollection {
	
		// 5
	func boot(routes: RoutesBuilder) throws {
		routes.get("all", use: getBooks)
		routes.get(":bookID", use: getBook)
		routes.get("search", use: searchBookByAuthor)
	}
}

