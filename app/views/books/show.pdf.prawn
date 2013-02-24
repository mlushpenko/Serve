prawn_document(:force_download => true) do |pdf|
  pdf.text "Image:"
  pdf.image open("public/assets/books/#{@book.id}/#{@book.image_file_name}")
  pdf.text "Title: #{@book.title}"
  pdf.text "Category: #{Category.find(@book.category_id).name}"
  pdf.text "Author: #{@book.author}"
  pdf.text "Description: #{@book.description}"
end
