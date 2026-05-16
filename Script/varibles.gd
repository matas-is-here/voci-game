extends Node

# words
var words = {"Hund": "dog", "Katze": "cat", "Stuhl": "chair", "Bruder": "brother", "Mensch": "human", "Schwester": "sister", "Ei": "egg", "Sonne": "sun", "Mond": "moon", "67": "67", "Deutsch": "German"}
var keys = words.keys()
var shuffled_keys = words.keys()

var is_english = true

# max_var
var max_count_set = 30
var min_count_set = 1

var max_count :int = 10
var max_mistakes = 2

# set_var
var mistakes = 0
var count :int = 1

var default_count_set = 10

var this_word_int = 0

var right = false

# other
var ger_word = ""

# functions

func get_word_len() -> int:
	return words.size()
