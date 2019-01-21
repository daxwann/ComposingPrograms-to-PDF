#! /nfs/2018/x/xwang/.rbenv/shims/ruby

require "nokogiri"
require "open-uri"
require_relative "./chapter"

class Book
    def initialize()
        @filename = "#{book_name}.html"
        @recipient = "Gina Giang"
        @chapters = Hash.new
        @main_url = "https://composingprograms.com/pages/";
    end

    def setChapterLink()
        @chapters["1.1"] = "11-getting-started.html"
        @chapters["1.2"] = "12-elements-of-programming.html"
        @chapters["1.3"] = "13-defining-new-functions.html"
        @chapters["1.4"] = "14-designing-functions.html"
        @chapters["1.6"] = "15-control.html"
        @chapters["1.7"] = "16-higher-order-functions.html"
        
    end
end
