extends Control
#variables
@onready var score = $score
@onready var Lives = $lives

func set_score(new_score):# new func set_score this needs a parameter or arguement called new_score
	score.text = "SCORE:" + str(new_score) #sets the given value as score in the label
	#if the "SCORE:" is not in the text, it could overwrite it with just number of score
	#this func will be called in game scene


func set_life(lives):#its similar to above func but for lives
	Lives.text = "lives:" + str(lives)#work in progess
