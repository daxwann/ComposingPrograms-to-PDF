#! /nfs/2018/x/xwang/.rbenv/shims/ruby

require_relative "book"
require_relative "chapter"
require_relative "pdf"

class Setting
    attr_accessor :book_name, :recipient

    def initialize()
        @book_name = "composing_programs"
        @recipient = "Gina Giang"
    end
end

# Scrape CP html for book text
setting = Setting.new()
book = Book.new(setting.book_name, setting.recipient)
book.setChapterUrl()
book.putsHeader()
book.putsIntro()
book.chapters.each do |ch, url|
    chapter = Chapter.new(url)
    chapter.putsChapter(book.file)
    book.putsCopyright()
    puts "Completed scraping chapter #{ch}"
end
book.putsFooter()
book.closeFile()

# Convert html to pdf
kit = PDFKit.new("http://localhost:8080/#{setting.book_name}.html")
kit.to_file("#{setting.book_name}.pdf")
