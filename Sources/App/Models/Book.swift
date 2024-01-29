//
//  Book.swift
//
//
//  Created by Ioannis Kapsouras on 29/1/24.
//

import Foundation

import Fluent
import Vapor

final class Book: Model, Content {
	static let schema = Create_20240129.schema
	
	@ID(key: .id)
	var id: UUID?
	
	@Field(key: Create_20240129.title)
	var title: String
	
	@OptionalField(key: Create_20240129.subtitle)
	var subtitle: String?
	
	@OptionalField(key: Create_20240129.coverImageUrl)
	var coverImageUrl: String?
	
	@OptionalField(key: Create_20240129.isbn)
	var isbn: String?
	
	@OptionalField(key: Create_20240129.place)
	var place: String?
	
	@Parent(key: .editorId)
	var editor: Editor
	
	@Timestamp(key: Create_20240129.createdAt, on: .create)
	var createdAt: Date?
	
	@Timestamp(key: Create_20240129.updatedAt, on: .update)
	var updatedAt: Date?
	
	@Siblings(
		through: BookCategoryPivot.self,
		from: \.$book,
		to: \.$category)
	var categories: [Category]
	
	init() { }
	
	init(id: UUID? = nil, title: String, subtitle: String?, coverImageUrl: String?, isbn: String?, place: String?, editorId: UUID) {
		self.id = id
		self.title = title
		self.subtitle = subtitle
		self.coverImageUrl = coverImageUrl
		self.isbn = isbn
		self.place = place
		self.$editor.id = editorId
	}
}

extension Book {
	enum Create_20240129 {
			// 2
		static let schema = "books"
			// 3
		static let title: FieldKey = .title
		static let subtitle: FieldKey = .subtitle
		static let coverImageUrl: FieldKey = .coverImageUrl
		static let isbn: FieldKey = .isbn
		static let editorId: FieldKey = .editorId
		static let place: FieldKey = .place
		static let createdAt: FieldKey = .createdAt
		static let updatedAt: FieldKey = .updatedAt
	}
}
