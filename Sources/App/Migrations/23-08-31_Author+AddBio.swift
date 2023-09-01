//
//  File.swift
//  
//
//  Created by Ioannis Kapsouras on 31/8/23.
//

import FluentKit

extension Author {
		// 1
	struct AddBio: AsyncMigration {
		func prepare(on database: Database)  async throws {
			return try await database
				.schema(Author.schema)
				// 2
				.field(Author.AddBio_20230831.bio, .string)
				// 3
				.update()
		}
		
		func revert(on database: Database)  async throws {
			return try await database
				.schema(Author.schema)
				// 4
				.deleteField(Author.AddBio_20230831.bio)
				.update()
		}
	}
}

