//
//  File.swift
//  
//
//  Created by Ioannis Kapsouras on 29/1/24.
//

import FluentKit

extension Category {
	struct Seed: AsyncMigration {
		func prepare(on database: Database) async throws {
				// 1
			let categories: [Category] = [
				.init(name: "Κλασικά"),
				.init(name: "Μυθιστόρημα"),
				.init(name: "Ψυχολογία")
			]
			
			
				// 2
			_ = categories.map { category in
				category.save(on: database)
			}
			
		}
		
		func revert(on database: Database) async throws {
				// 3
			return try await Category.query(on: database).delete()
		}
	}
}
