//
//  File.swift
//  
//
//  Created by Ioannis Kapsouras on 1/9/23.
//

import FluentKit

extension Editor {
	struct Seed: AsyncMigration {
		func prepare(on database: Database) async throws {
				// 1
			let editors: [Editor] = [
				.init(name: "Μεταίχμιο", imageUrl: nil),
				.init(name: "Παττάκη", imageUrl: nil),
				.init(name: "Διόπτρα", imageUrl: nil)
			]
			
			
				// 2
			_ = editors.map { editor in
				editor.save(on: database)
			}
			
		}
		
		func revert(on database: Database) async throws {
				// 3
			return try await Editor.query(on: database).delete()
		}
	}
}
