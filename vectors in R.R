MyFirstvector <- c(3, 45, 56, 732) #c- combine
MyFirstvector
is.numeric(MyFirstvector)
is.integer(MyFirstvector) #False, because R stored the vectors as double hence it gave FALSE as output.

MySecond <- c(3L, 45L, 56L, 732L) #stores as integer
is.integer(MySecond)


#character vector
MyChar <- c("a", "hello", "sunflower")
MyChar
is.character(MyChar)


#char and num together, can they co-exist?

MyCombo <- c("a","hello", "forever", "arigato", "mosi mosi", 10)
MyCombo # as the output says, the number 10 has been converted into character as it is in double quotes.

#COERSION RULE 1
#If a vector has atleast one string value, all other elements will be converted into string, but not vice versa.


#logical and numerical values together

MyCombo2 <- c(1, 2, 4, 5, TRUE, FALSE)
MyCombo2  # output as - 1 2 4 5 1 0

#COERSION RULE 2
#If a vector has only logical and numerical values, all logical values will be converted into numbers 
#i.e., TRUE = 1, FALSE = 2





#sequence function
seq(1,15)
1:15

#both are giving the same output. Then what's the difference. 
#Well, with sequence, you can use another parameter called step that will give you numbers between 1 to 15 with a gap of 2.

seq(1,15,2)


#replication
rep("Hello!", 3)

#to access individual elements of vectors
w <- c("a","b","c","d","e","f","g","h","i")
w
w[1]    #in R programming, indexing starts with 1
w[2]
w[-1]   #all except first one
w[-3]   #all except third one
w[1:6] 
w[3:5]
w[c(1,3,5)]
w[c(-2,-4)]
w[c(-3:-6)]























