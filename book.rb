require "nokogiri"
require "open-uri"

class Book
    attr_accessor :chapters, :file

    def initialize(book_name, recipient)
        @file = File.open("#{book_name}.html", "w");
        @recipient = recipient
        @chapters = Hash.new
        @home_url = "https://composingprograms.com"
        @header = "./partials/header.html"
        @footer = "./partials/footer.html"
        @copyright = "./partials/copyright.html"
    end

    def setChapterUrl()
        @chapters["1.1"] = "11-getting-started.html"
        @chapters["1.2"] = "12-elements-of-programming.html"
        @chapters["1.3"] = "13-defining-new-functions.html"
        @chapters["1.4"] = "14-designing-functions.html"
        @chapters["1.6"] = "15-control.html"
        @chapters["1.7"] = "16-higher-order-functions.html"
        @chapters["2.1"] = "21-introduction.html"
        @chapters["2.2"] = "22-data-abstraction.html"
        @chapters["2.3"] = "23-sequences.html"
        @chapters["2.4"] = "24-mutable-data.html"
        @chapters["2.5"] = "25-object-oriented-programming.html"
        @chapters["2.6"] = "26-implementing-classes-and-objects.html"
        @chapters["2.7"] = "27-object-abstraction.html"
        @chapters["2.8"] = "28-efficiency.html"
        @chapters["2.9"] = "29-recursive-objects.html"
        @chapters["3.1"] = "31-introduction.html"
        @chapters["3.2"] = "32-functional-programming.html"
        @chapters["3.3"] = "33-exceptions.html"
        @chapters["3.4"] = "34-interpreters-for-languages-with-combination.html"
        @chapters["3.5"] = "35-interpreters-for-languages-with-abstraction.html"
        @chapters["4.1"] = "41-introduction.html"
        @chapters["4.2"] = "42-implicit-sequences.html"
        @chapters["4.3"] = "43-declarative-programming.html"
        @chapters["4.4"] = "44-logic-programming.html"
        @chapters["4.5"] = "45-unification.html"
        @chapters["4.6"] = "46-distributed-computing.html"
        @chapters["4.7"] = "47-distributed-data-processing.html"
        @chapters["4.8"] = "48-parallel-computing.html"
    end

    def putsHeader()
        header = File.read(@header)
        @file.write(header)
    end

    def parseIntro()
        intro = Nokogiri::HTML(open(@home_url))
        return intro.css('.inner-content')[0]
    end

    def putsIntro()
        intro = self.parseIntro()
        @file.write(intro)
    end

    def putsCopyright()
        copyright = File.read(@copyright)
        @file.write(copyright)
    end

    def putsFooter()
        footer = File.read(@footer)
        @file.write(footer)
    end

    def closeFile()
        @file.close
    end
end
