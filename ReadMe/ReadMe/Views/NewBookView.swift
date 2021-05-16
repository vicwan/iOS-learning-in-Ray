//
//  NewBookView.swift
//  ReadMe
//
//  Created by Vic on 2021/5/16.
//

import SwiftUI

struct NewBookView: View {
  @ObservedObject var book: Book = Book(title: "", author: "")
  @State private var image: UIImage? = nil
  @EnvironmentObject var library: Library
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView {
      VStack(spacing: 24.0) {
        TextField("Title", text: $book.title)
        TextField("Author", text: $book.author)
        ReviewAndImageStack(book: book, image: $image)
      }
      .padding()
      .navigationTitle("Got a new book?")
      .toolbar {
        ToolbarItem(placement: .status) {
          Button("Add to Library") {
            library.addNewBook(book, image: image)
            presentationMode.wrappedValue.dismiss()
          }
          .disabled(
            [book.title, book.author].contains(where: \.isEmpty)
          )
        }
      }
    }
  }
}

struct NewBookView_Previews: PreviewProvider {
  static var previews: some View {
    NewBookView().environmentObject(Library())
  }
}
