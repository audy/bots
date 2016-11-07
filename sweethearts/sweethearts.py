#!/usr/bin/env python

import time
import random
import spacy
from collections import defaultdict

def tags(sentence, model):
    tokens = model(sentence)
    for tok in tokens:
        yield (tok, tok.tag_)

def word_letters(word):
    '''
    return all of the letters used in a word
    '''
    letters = set()
    for letter in word:
        letters.add(letter)
    return letters


def chunks(iterator, n):
    chunk = []
    for i in iterator:
        chunk.append(i)

        if len(chunk) >= n:
            yield chunk
            chunk = []


# load english language
nlp = spacy.load('en')

# naive approach: randomly generate combinations of words and then check if
# they fit the rule
#
# better approach: POS tag dictionary and sample

with open('dictionary.txt') as handle:
    dictionary = set([ i.strip().lower() for i in handle ])

allowed_letters = [
    set('sweethearts'),
    set('snowflakes'),
    set('earthquakes'),
    set('art shows')
]

rule = [ 'PRP', 'VBZ', 'PRP$', 'JJ', 'NN' ]

# categorize all words (that are sweetheart words) by their parts of speech
tagged_dictionary = defaultdict(list)
for word in dictionary:
    pos = list(tags(word, nlp))[0][1]
    tagged_dictionary[pos].append(word)

# make sweethearts poetry forever
while True:
    sentence = []
    current_letter_rule = random.sample(allowed_letters, 1)[0]
    for r in rule:
        while True:
            word = random.sample(tagged_dictionary[pos], 1)
            if len(set(word) - current_letter_rule) == 0:
                sentence.extend(random.sample(tagged_dictionary[pos], 1))
                break
    print(' '.join(sentence))
    time.sleep(1)
