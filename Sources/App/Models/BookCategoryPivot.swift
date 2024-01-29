//
//  File.swift
//  
//
//  Created by Ioannis Kapsouras on 29/1/24.
//

import Fluent
import Foundation

	// 1
final class BookCategoryPivot: Model {
	static let schema = Create_20240129.schema
	
		// 2
	@ID
	var id: UUID?
	
		// 3
	@Parent(key: Create_20240129.bookId)
	var book: Book
	
	@Parent(key: Create_20240129.categoryId)
	var category: Category
	
		// 4
	init() {}
	
		// 5
	init(
		id: UUID? = nil,
		book: Book,
		category: Category
	) throws {
		self.id = id
		self.$book.id = try book.requireID()
		self.$category.id = try category.requireID()
	}
}

extension BookCategoryPivot {
	enum Create_20240129 {
			// 2
		static let schema = "book-category-pivot"
			// 3
		static let bookId: FieldKey = .bookId
		static let categoryId: FieldKey = .categoryId
	}
}
