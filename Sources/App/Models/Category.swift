//
//  Category.swift
//  
//
//  Created by Ioannis Kapsouras on 29/1/24.
//

import Fluent
import Vapor

final class Category: Model, Content {
	static let schema = Create_20240129.schema
	
	@ID(key: .id)
	var id: UUID?
	
	@Field(key: Create_20240129.name)
	var name: String
	
	@Timestamp(key: Create_20240129.createdAt, on: .create)
	var createdAt: Date?
	
	@Timestamp(key: Create_20240129.updatedAt, on: .update)
	var updatedAt: Date?
	
	@Siblings(
		through: BookCategoryPivot.self,
		from: \.$category,
		to: \.$book)
	var books: [Book]
	
	init() { }
	
	init(id: UUID? = nil, name: String) {
		self.id = id
		self.name = name
	}
}

	// 1
extension Category {
	enum Create_20240129 {
			// 2
		static let schema = "categories"
			// 3
		static let name: FieldKey = .name
		static let createdAt: FieldKey = .createdAt
		static let updatedAt: FieldKey = .updatedAt
	}
}



