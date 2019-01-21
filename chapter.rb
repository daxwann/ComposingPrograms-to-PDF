require "nokogiri"
require "open-uri"

class Chapter
    def initialize(url)
        @pages_url = "https://composingprograms.com/pages/"
        @url = url
    end

    def parseChapter()
        chapter = Nokogiri::HTML(open(@pages_url + @url))
        return chapter.css('.inner-content')[0]
    end

    def putsChapter(book_file)
        chapter = self.parseChapter()
        book_file.write(chapter)
    end
end