//
//  File.swift
//  
//
//  Created by Ioannis Kapsouras on 31/8/23.
//

import FluentKit

extension Author {
	struct MakeNameUnique: AsyncMigration {
		func prepare(on database: Database) async throws {
			return try await database
				.schema(Author.schema)
				// 2
				.unique(
					on: Author.Create_20230831.name,
					name: "unique_author_name"
				)
				.update()
		}
		
		func revert(on database: Database) async throws {
			return try await database
				.schema(Author.schema)
				// 3
				.deleteUnique(
					on: Author.Create_20230831.name
				)
				.update()
		}
	}
}
