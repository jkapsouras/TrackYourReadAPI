//
//  File.swift
//
//
//  Created by Ioannis Kapsouras on 15/9/23.
//

import Fluent
import Vapor

final class Address: Model, Content {
	static let schema = Create_20230915.schema
	
	@ID(key: .id)
	var id: UUID?
	
	@Parent(key: .editorId)
	var editor: Editor
	
	@Field(key: Create_20230915.streetName)
	var streetName: String
	
	@Field(key: Create_20230915.streetNumber)
	var streetNumber: String
	
	@Field(key: Create_20230915.city)
	var city: String
	
	@Field(key: Create_20230915.country)
	var country: String
	
	@Field(key: Create_20230915.postCode)
	var postCode: String?
	
	@Timestamp(key: Create_20230915.createdAt, on: .create)
	var createdAt: Date?
	
	@Timestamp(key: Create_20230915.updatedAt, on: .update)
	var updatedAt: Date?
	
	init() { }
	
	init(id: UUID? = nil, streetName: String, streetNumber: String, city: String, country: String, postCode: String?, editorId: UUID) {
		self.id = id
		self.streetName = streetName
		self.streetNumber = streetNumber
		self.city = city
		self.country = country
		self.postCode = postCode
		self.$editor.id = editorId
	}
}

// 1
extension Address {
	enum Create_20230915 {
		// 2
		static let schema = "addresses"
		// 3
		static let streetName: FieldKey = .streetName
		static let streetNumber: FieldKey = .streetNumber
		static let city: FieldKey = .city
		static let postCode: FieldKey = .postCode
		static let country: FieldKey = .country
		static let editorId: FieldKey = .editorId
		static let createdAt: FieldKey = .createdAt
		static let updatedAt: FieldKey = .updatedAt
	}
	
	enum AddEditorId_20230915 {
		static let editorId: FieldKey = .editorId
	}
}


