//
//  File.swift
//  
//
//  Created by Ioannis Kapsouras on 1/9/23.
//

import FluentKit

	// 2
extension Editor {
	struct Create: AsyncMigration {
			// 3
		func prepare(on database: Database) async throws {
			return try await database
				.schema(Create_20230901.schema) // 4
				.id() // 5
				.field(Create_20230901.name, .string, .required) // 6
				.field(Create_20230901.imageUrl, .string) // 6
				.field(Create_20230901.createdAt, .datetime) // 7
				.field(Create_20230901.updatedAt, .datetime)
				.unique(
					on: Editor.Create_20230901.name,
					name: "unique_editor_name"
				)
				.create() // 8
		}
		
			// 9
		func revert(on database: Database)  async throws {
			return try await database.schema(Create_20230901.schema).delete()
		}
	}
}

