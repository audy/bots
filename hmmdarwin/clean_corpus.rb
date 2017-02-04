#!/usr/bin/env ruby

corpus = File.read(ARGV[0])

# remove newlines, extra spaces
corpus = corpus.
  tr("\r", ' ').
  tr("\n", ' ').
  gsub(/\s+/, ' ')

# remove periods used in Ms., Dr., etc...
corpus = corpus.
  gsub('Dr.', 'Dr').
  gsub('Ms.', 'Ms').
  gsub('Mrs.', 'Mrs').
  gsub('Prof.', 'Prof')

# turn sentence delimiters into newlines
corpus = corpus.
  split(/\.\s?/).
  map { |x| "#{x}." }. # replace period so I can use this script again
  map &:strip

# remove short phrases
corpus = corpus.keep_if { |x| x.size >= 140 }

File.open(ARGV[0], 'w').write(corpus.join("\n"))
