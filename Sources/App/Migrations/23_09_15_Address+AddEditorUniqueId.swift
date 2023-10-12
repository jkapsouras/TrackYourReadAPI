//
//  File.swift
//  
//
//  Created by Apprecot on 15/9/23.
//

import FluentKit

extension Address {
	// 1
	struct AddEditorIdUnique: AsyncMigration {
		func prepare(on database: Database)  async throws {
			return try await database
				.schema(Address.schema)
			// 2
//				.field(Address.AddEditorId_20230915.editorId, .uuid, .required)
				.field(Address.AddEditorId_20230915.editorId, .uuid, .required)
//				.foreignKey(Address.AddEditorId_20230915.editorId, references: Editor.schema, .id, onDelete: .cascade, onUpdate: .noAction)
				.unique(on: Address.AddEditorId_20230915.editorId)
			// 3
				.update()
		}
		
		func revert(on database: Database)  async throws {
			return try await database
				.schema(Address.schema)
			// 4
				.deleteField(Address.AddEditorId_20230915.editorId)
				.update()
		}
	}
}


