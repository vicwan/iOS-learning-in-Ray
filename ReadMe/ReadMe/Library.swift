/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Combine
import class UIKit.UIImage
import Foundation

enum Section: CaseIterable {
  case readMe
  case finished
}

final class Library: ObservableObject {
  var sortedBooks: [Book] {
    get { booksCache }
    set {
      booksCache.removeAll { book in
        !newValue.contains(book)
      }
    }
  }
  
  var manuallySortedBooks: [Section: [Book]] {
    get {
      /// 通过 Book 的 readMe 字段对 booksCache 里面的对象进行分组, 并映射, 最后返回该字典
      Dictionary(grouping: booksCache, by: \.readMe)
        .mapKeys(Section.init)
    }
    set {
      booksCache =
        newValue
        .sorted { $1.key == .finished }
        .flatMap { $0.value }
    }
  }
  
  
  /// Adds a new book at the start of the library's manually-sorted books
  func addNewBook(_ book: Book, image: UIImage?) {
    booksCache.insert(book, at: 0)
    uiImages[book] = image
    storeCancellable(for: book)
  }
  
  func deleteBooks(atOffsets offsets: IndexSet, section: Section?) {
    let booksBeforeDeletion = booksCache
    
    if let section = section {
      manuallySortedBooks[section]?.remove(atOffsets: offsets)
    } else {
      sortedBooks.remove(atOffsets: offsets)
    }
    
    for change in booksCache.difference(from: booksBeforeDeletion) {
      if case .remove(_, let deletedBook, _) = change {
        uiImages[deletedBook] = nil
      }
    }
  }
  
  func moveBooks(
    oldOffsets: IndexSet, newOffset: Int,
    section: Section
  ) {
    manuallySortedBooks[section]?.move(fromOffsets: oldOffsets, toOffset: newOffset)
  }
  
  @Published var uiImages: [Book: UIImage] = [:]
  
  init() {
    booksCache.forEach(storeCancellable)
  }

  /// An in-memory cache of the manually-sorted books that are persistently stored.
  @Published private var booksCache: [Book] = [
    .init(title: "Ein Neues Land", author: "Shaun Tan"),
    .init(
      title: "Bosch",
      author: "Laurinda Dixon",
      microReview: "Earthily Delightful"
    ),
    .init(title: "Dare to Lead", author: "Brené Brown"),
    .init(
      title: "Blasting for Optimum Health Recipe Book",
      author: "NutriBullet",
      microReview: "Blastastic!"
      ),
    .init(title: "Drinking with the Saints", author: "Michael P. Foley"),
    .init(title: "A Guide to Tea", author: "Adagio Teas"),
    .init(title: "The Life and Complete Work of Francisco Goya", author: "P. Gassier & J Wilson"),
    .init(title: "Lady Cottington's Pressed Fairy Book", author: "Lady Cottington"),
    .init(title: "How to Draw Cats", author: "Janet Rancan"),
    .init(title: "Drawing People", author: "Barbara Bradley"),
    .init(title: "What to Say When You Talk to Yourself", author: "Shad Helmstetter")
  ]
  
  /// Forward individual book changes to be considered Library changes.
  private var cancellables: Set<AnyCancellable> = []
}

// MARK: - private

private extension Library {
  func storeCancellable(for book: Book) {
    book.$readMe.sink { [unowned self] _ in
      objectWillChange.send()
    }
    .store(in: &cancellables)
  }
}

private extension Section {
  init(readMe: Bool) {
    self = readMe ? .readMe : .finished
  }
}

private extension Dictionary {
  /// Same values, corresponding to `map`ped keys.
  ///
  /// - Parameter transform: Accepts each key of the dictionary as its parameter
  ///   and returns a key for the new dictionary.
  /// - Postcondition: The collection of transformed keys must not contain duplicates.
  func mapKeys<Transformed>(
    _ transform: (Key) throws -> Transformed
  ) rethrows -> [Transformed: Value] {
    .init(
      uniqueKeysWithValues: try map { (try transform($0.key), $0.value) }
    )
  }
}
