#!/usr/bin/env ruby
# encoding: UTF-8

require 'bundler'
Bundler.require

class Hector

  def initialize
    # TODO: sample adverbs from disk?
    @verbs = %w{
      attacks
      bites
      climbs
      contemplates
      crouches
      empathizes
      evades
      gallops
      gazes
      hides
      hisses
      hovers
      investigates
      jumps
      licks
      looks
      loves
      meditates
      meows
      naps
      nuzzles
      purrs
      regurgitates
      retaliates
      rolls
      scratches
      scurries
      sheds
      sings
      sleeps
      smells
      sneezes
      squeaks
      squeels
      stalks
      struts
      studies
      sulks
      swats
    }

    @adverbs =
      File.readlines('adverbs.txt').
      map(&:strip).
      reject { |x| x =~ /^[A-Z]/ }.
      keep_if { |x| !!(x =~ /.*ly$/) }

    @cats = File.open('cats.txt', 'r:UTF-8').readlines.map(&:strip)

    @cat_chance = 1/10.0
  end

  def verb
    @verbs.sample
  end

  def adverb
    @adverbs.sample
  end

  def cat
    @cats.sample
  end

  def sometimes_a_cat
    ' ' + @cats.sample if rand < (1/5.0)
  end

  def full_action
    "#{verb} #{adverb}#{sometimes_a_cat}"
  end

  def do_something
    full_action
  end
end
