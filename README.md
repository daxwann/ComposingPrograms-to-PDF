# Composing Programs HTML text to PDF

Ruby program that parses the book portion of [Composing Programs](https://composingprograms.com/) and converts it to PDF.

## How to use CPtoPDF

Make sure all dependencies in Gemfile are available.

```
$ bundle install
```

In a separate terminal window, Open local server in root folder. Port set to 8080:

```
ruby -run -e httpd -- . -p 8080
```

Return to the first terminal window, then run cptopdf in lib

```
$ cd lib
```
```
$ ruby cptopdf.rb
```

PDF file will be created in the root folder

## Authors
Dax Wann

## Acknowledgement

Composing Programs by John DeNero, based on the textbook Structure and Interpretation of Computer Programs by Harold Abelson and Gerald Jay Sussman, is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.



