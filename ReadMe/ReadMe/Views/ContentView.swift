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
        
        ForEach(Section.allCases, id: \.self) {
          SectionView(section: $0)
        }
      }
      .toolbar(content: EditButton.init)
      .navigationTitle("My Library")
    }
  }
}

private struct BookRow: View {
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

private struct SectionView: View {
  let section: Section
  @EnvironmentObject var library: Library
  
  var title: String {
    switch section {
    
    case .readMe:
      return "Read Me!"
    case .finished:
      return "Finished!"
    }
  }
  
  var body: some View {
    if let books = library.manuallySortedBooks[section] {
      SwiftUI.Section(
        header:
          ZStack {
            Image("BookTexture")
              .resizable()
              .scaledToFit()
            Text(title)
              .font(.custom("American Typewriter", size: 24))
          }
          .listRowInsets(.init())
      ) {
        ForEach(books) {
          BookRow(book: $0)
        }
        .onDelete { indexSet in
          library.deleteBooks(atOffsets: indexSet, section: section)
        }
        .onMove { indices, newOffset in
          library.moveBooks(oldOffsets: indices, newOffset: newOffset, section: section)
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(Library())
      .previewdInAllColorSchemes
  }
}


