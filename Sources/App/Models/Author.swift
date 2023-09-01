//
//  File.swift
//  
//
//  Created by Ioannis Kapsouras on 31/8/23.
//

import Fluent
import Vapor

final class Author: Model, Content {
	static let schema = Create_20230831.schema
	
	@ID(key: .id)
	var id: UUID?
	
	@Field(key: Create_20230831.name)
	var name: String
	
	@Field(key: Create_20230831.imageUrl)
	var imageUrl: String?
	
	@OptionalField(key: AddBio_20230831.bio)
	var bio: String?
	
	@Timestamp(key: Create_20230831.createdAt, on: .create)
	var createdAt: Date?
	
	@Timestamp(key: Create_20230831.updatedAt, on: .update)
	var updatedAt: Date?
	
	init() { }
	
	init(id: UUID? = nil, name: String, imageUrl: String?, bio: String?) {
		self.id = id
		self.name = name
		self.imageUrl = imageUrl
		self.bio = bio
	}
}

	// 1
extension Author {
	enum Create_20230831 {
			// 2
		static let schema = "authors"
			// 3
		static let name: FieldKey = .name
		static let imageUrl: FieldKey = .imageUrl
		static let createdAt: FieldKey = .createdAt
		static let updatedAt: FieldKey = .updatedAt
	}
	
	enum AddBio_20230831 {
		static let bio: FieldKey = .bio
	}
}


