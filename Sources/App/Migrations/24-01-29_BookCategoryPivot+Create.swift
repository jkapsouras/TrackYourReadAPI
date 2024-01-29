//
//  File.swift
//  
//
//  Created by Ioannis Kapsouras on 29/1/24.
//

import Fluent

	// 1
extension BookCategoryPivot {
	struct Create: AsyncMigration {
			// 3
		func prepare(on database: Database) async throws {
			return try await database
				.schema(Create_20240129.schema) // 4
				.id()
				.field(Create_20240129.bookId, .uuid, .required,
					   .references("books", "id", onDelete: .cascade))
				.field(Create_20240129.categoryId, .uuid, .required,
					   .references("categories", "id", onDelete: .cascade))
				.create()
		}
		
			// 9
		func revert(on database: Database)  async throws {
			return try await database.schema(Create_20240129.schema).delete()
		}
	}
}

