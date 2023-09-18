//
//  File.swift
//  
//
//  Created by Apprecot on 15/9/23.
//

import FluentKit

// 2
extension Address {
	struct Create: AsyncMigration {
		// 3
		func prepare(on database: Database) async throws {
			return try await database
				.schema(Create_20230915.schema) // 4
				.id() // 5
				.field(Create_20230915.streetName, .string, .required) // 6
				.field(Create_20230915.streetNumber, .string, .required) // 6
				.field(Create_20230915.city, .string, .required) // 6
				.field(Create_20230915.country, .string, .required) // 6
				.field(Create_20230915.postCode, .string) // 6
				.field(Create_20230915.createdAt, .datetime) // 7
				.field(Create_20230915.updatedAt, .datetime)
				.create() // 8
		}
		
		// 9
		func revert(on database: Database)  async throws {
			return try await database.schema(Create_20230915.schema).delete()
		}
	}
}
