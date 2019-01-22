require "nokogiri"
require "open-uri"
# encoding: utf-8

class Chapter
    def initialize(url)
        @pages_url = "https://composingprograms.com/pages/"
        @url = url
    end

    def changeId(chapter)
        id = @url.gsub(/^(.*)\.html$/, '\1')
        chapter_newid = chapter.gsub(/(inner-content.*?id=\").*?(\")/mi, '\1' + id + '\2')
        return chapter_newid
    end

    def parseChapter()
        page = Nokogiri::HTML(open(@pages_url + @url))
        chapter = page.css('.inner-content').first.to_html
        chapter_newid = self.changeId(chapter)
        return chapter_newid
    end

    def putsChapter(book_file)
        chapter = self.parseChapter()
        book_file.write(chapter)
    end
end