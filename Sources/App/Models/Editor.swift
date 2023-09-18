//
//  File.swift
//  
//
//  Created by Ioannis Kapsouras on 1/9/23.
//

import Fluent
import Vapor

final class Editor: Model, Content {
	static let schema = Create_20230901.schema
	
	@ID(key: .id)
	var id: UUID?
	
	@Field(key: Create_20230901.name)
	var name: String
	
	@Field(key: Create_20230901.imageUrl)
	var imageUrl: String?
	
	@Timestamp(key: Create_20230901.createdAt, on: .create)
	var createdAt: Date?
	
	@Timestamp(key: Create_20230901.updatedAt, on: .update)
	var updatedAt: Date?
	
	@Children(for: \.$editor) var address: [Address]
	
	init() { }
	
	init(id: UUID? = nil, name: String, imageUrl: String?) {
		self.id = id
		self.name = name
		self.imageUrl = imageUrl
	}
}

	// 1
extension Editor {
	enum Create_20230901 {
			// 2
		static let schema = "editors"
			// 3
		static let name: FieldKey = .name
		static let imageUrl: FieldKey = .imageUrl
		static let createdAt: FieldKey = .createdAt
		static let updatedAt: FieldKey = .updatedAt
	}
	
	enum AddEditorId_20230915 {
		static let editorId: FieldKey = .editorId
	}
}


