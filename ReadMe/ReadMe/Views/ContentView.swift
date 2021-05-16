//
//  ContentView.swift
//  ReadMe
//
//  Created by Vic Wan on 2021/5/16.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var library: Library
  @State private var addingNewBook: Bool = false
  
  var body: some View {
    NavigationView {
      List{
        Button(action: {
          addingNewBook = true
        }, label: {
          Spacer()
          
          VStack(spacing: 6.0) {
            Image(systemName: "book.circle")
              .font(.system(size: 60))
            Text("Add New Book")
              .font(.title2)
          }
          
          Spacer()
        })
        .buttonStyle(BorderlessButtonStyle())
        .padding(.vertical)
        .sheet(
          isPresented: $addingNewBook,
          content: NewBookView.init
        )
        
        ForEach(library.sortedBooks) { book in
          BookRow(book: book)
        }
      }
      .navigationTitle("My Library")
    }
  }
}

struct BookRow: View {
  @ObservedObject var book: Book
  @EnvironmentObject var library: Library
  
  var body: some View {
    NavigationLink(
      destination: DetailView(book: book),
      label: {
        HStack {
          Book.Image(
            uiImage: library.uiImages[book],
            title: book.title,
            size: 80,
            cornerRadius: 0
          )
          VStack(alignment: .leading) {
            TitleAndAuthorStack(
              book: book,
              titleFont: .title2,
              authorFont: .title3
            )
            
            
            if !book.microReview.isEmpty {
              Spacer()
              Text(book.microReview)
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
          }
          .lineLimit(1)
          
          Spacer()
          
          BookmarkButton(book: book)
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding(.vertical, 8)
      })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(Library())
      .previewdInAllColorSchemes
  }
}


