//
//  File.swift
//  
//
//  Created by Ioannis Kapsouras on 29/1/24.
//

import FluentKit

	// 2
extension Book {
	struct Create: AsyncMigration {
			// 3
		func prepare(on database: Database) async throws {
			return try await database
				.schema(Create_20240129.schema) // 4
				.id() // 5
				.field(Create_20240129.title, .string, .required) // 6
				.field(Create_20240129.subtitle, .string) // 6
				.field(Create_20240129.coverImageUrl, .string) // 6
				.field(Create_20240129.isbn, .string) // 6
				.field(Create_20240129.place, .string) // 6
				.field(Create_20240129.editorId, .uuid, .required)
				.unique(on: Create_20240129.editorId)
				.field(Create_20240129.createdAt, .datetime) // 7
				.field(Create_20240129.updatedAt, .datetime)
				.create() // 8
		}
		
			// 9
		func revert(on database: Database)  async throws {
			return try await database.schema(Create_20240129.schema).delete()
		}
	}
}


