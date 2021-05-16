//
//  DetailView.swift
//  ReadMe
//
//  Created by Vic on 2021/5/16.
//

import class PhotosUI.PHPickerViewController
import SwiftUI

struct DetailView: View {
  @ObservedObject var book: Book
  @Binding var image: UIImage?
  @State private var showingImagePicker = false
  @State private var showingDeleteAlert = false
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack(spacing: 16) {
        BookmarkButton(book: book)
        TitleAndAuthorStack(
          book: book,
          titleFont: .title,
          authorFont: .title2
        )
      }
      
      VStack {
        Divider()
          .padding(.vertical)
        TextField("Review...", text: $book.microReview)
        Divider()
          .padding(.vertical)
        
        Book.Image(
          uiImage: image,
          title: book.title,
          cornerRadius: 16
        )
        .scaledToFit()
        
        let updateButton = Button("Update Image...") {
          showingImagePicker = true
        }
        .padding()
        
        if image != nil {
          HStack {
            Spacer()
            Button("Delete Image") {
              showingDeleteAlert = true
            }
            Spacer()
            updateButton
            Spacer()
          }
        } else {
          updateButton
        }
      }
      
      Spacer()
    }
    .padding()
    .sheet(isPresented: $showingImagePicker) {
      PHPickerViewController.View(image: $image)
    }
    .alert(isPresented: $showingDeleteAlert) {
      .init(
        title: .init("Delete image for \(book.title)?"),
        primaryButton: .destructive(.init("Delete")) {
          image = nil
        },
        secondaryButton: .cancel())
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      DetailView(book: .init(), image: .constant(nil) )
    }
    .previewdInAllColorSchemes
  }
}
