//
//  File.swift
//  
//
//  Created by Ioannis Kapsouras on 31/8/23.
//

	// 1
import FluentKit

	// 2
extension Author {
	struct Create: AsyncMigration {
			// 3
		func prepare(on database: Database) async throws {
			return try await database
				.schema(Create_20230831.schema) // 4
				.id() // 5
				.field(Create_20230831.name, .string, .required) // 6
				.field(Create_20230831.imageUrl, .string) // 6
				.field(Create_20230831.createdAt, .datetime) // 7
				.field(Create_20230831.updatedAt, .datetime)
				.create() // 8
		}
		
			// 9
		func revert(on database: Database)  async throws {
			return try await database.schema(Create_20230831.schema).delete()
		}
	}
}
