//
//  File.swift
//  
//
//  Created by Ioannis Kapsouras on 31/8/23.
//

	// 1
import FluentKit

	// 2
extension FieldKey {
		// 3
	static let createdAt: FieldKey = "created_at"
	static let name: FieldKey = "name"
	static let bio: FieldKey = "bio"
	static let updatedAt: FieldKey = "updated_at"
	static let imageUrl: FieldKey = "image_url"
	static let streetName: FieldKey = "street_name"
	static let streetNumber: FieldKey = "street_number"
	static let country: FieldKey = "country"
	static let city: FieldKey = "city"
	static let postCode: FieldKey = "post_code"
	static let editorId: FieldKey = "editor_id"
	static let title: FieldKey = "title"
	static let subtitle: FieldKey = "subtitle"
	static let coverImageUrl: FieldKey = "cover_image_url"
	static let isbn: FieldKey = "isbn"
	static let place: FieldKey = "place"
	static let bookId: FieldKey = "book_id"
	static let categoryId: FieldKey = "category_id"
}
