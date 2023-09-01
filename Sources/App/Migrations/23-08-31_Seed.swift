//
//  File.swift
//  
//
//  Created by Ioannis Kapsouras on 31/8/23.
//

import FluentKit

extension Author {
	struct Seed: AsyncMigration {
		func prepare(on database: Database) async throws {
				// 1
			let authors: [Author] = [
				.init(name: "Jo Nesbo", imageUrl: nil, bio: nil),
				.init(name: "Ian McEwan", imageUrl: nil, bio: nil),
				.init(name: "Carlos Ruiz Zafón", imageUrl: nil, bio: nil)
			]
			
			
				// 2
			 _ = authors.map { author in
				author.save(on: database)
			}
			
		}
		
		func revert(on database: Database) async throws {
				// 3
			return try await Author.query(on: database).delete()
		}
	}
}
