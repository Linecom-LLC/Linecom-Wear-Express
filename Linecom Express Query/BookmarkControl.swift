//
//  BookmarkControl.swift
//  Linecom Express Query Watch App
//
//  Created by 程炜栋 on 2025/2/21.
//

import Foundation

struct Bookmark: Codable, Identifiable, Equatable {
    let id: UUID
    let nu: String
    let provider: String
    let phone: String
}

class BookmarkManager: ObservableObject {
    @Published var bookmarks: [Bookmark] = []

    private let key = "bookmarks"

    init() {
        loadBookmarks()
    }

    /// Save bookmarks to UserDefaults
    func saveBookmarks() {
        if let encoded = try? JSONEncoder().encode(bookmarks) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    /// Load bookmarks from UserDefaults
    func loadBookmarks() {
        if let savedData = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([Bookmark].self, from: savedData) {
            bookmarks = decoded
        }
    }

    /// Add a new bookmark
    func addBookmark(nu: String, provider: String, phone: String) {
        let newBookmark = Bookmark(id: UUID(), nu: nu, provider: provider, phone: phone)
        bookmarks.append(newBookmark)
        saveBookmarks()
    }

    /// Remove a bookmark
    func removeBookmark(_ bookmark: Bookmark) {
        bookmarks.removeAll { $0.id == bookmark.id }
        saveBookmarks()
    }

    /// Check if a bookmark exists
    func isBookmarked(nu: String) -> Bool {
        return bookmarks.contains { $0.nu == nu }
    }
}
