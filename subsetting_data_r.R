# Part 2 - Subsetting data
# broom icon under environment ribbon cleans up variables

# notes on subsetting: three different ways

# 1) By name: 

my_data <- read.csv("/home/nwknoblauch/Public/r-novice-inflammation/data/car-speeds.csv")

my_data$Color

#dollar sign gives us named columns of our data frames...
# note columns sometimes have default names

inf_data <- read.csv("/home/nwknoblauch/Public/r-novice-inflammation/data/inflammation-01.csv", header = FALSE)
day_13<-inf_data$V13

# 2) we can also subset data by its index using the bracket notation

day_13[6:10]

# we can also subset dataframes by index using the bracket notation

inf_data[1:3,4:8]
# first 3 patients day 4-8

day_13[2]

# can use c(, which means combine, instead of using column numbers....c("Color", "Speed")

Color_Speed <- c("Color", "Speed")
my_data[1:3, Color_Speed
        ]
# 3) "Logical" or "Boolean" or "True/False"

x<-rnorm(n=100000)
#rnorm was function we looked up in the help section...in normal distribution section....just generates random numbers
length(x)
sum(x)
mean(x)
hist(x)
plot(x)

pos_x <- x[x>0]
length(pos_x)
mean(pos_x)


#both below are equivalent
is_pos_x <- x>0
pos_x2 <- x[is_pos_x
            ]
#length has to match for logical subsetting

# Using functions...

rnorm_pos <- function(n){ #function requires number of imputs (n) and the actual function laid out in the curly brackets
  y <- rnorm(n)
  is_pos_y <- y>0
  return(y[is_pos_y]) #return gives back specific values...everything outside of return stays within the function...every function needs a return
}
#note...variables like 'y' above will not be given a value outside of the funciton
r_norm_v <- function(n,v){
  y <- rnorm(n)
  is_above_v <- y > v
  return(y[is_above_v])
  
  }

pos_data <- rnorm_pos(20000
                      )
hist(pos_data)


#write out own script...write function that generates random numbers then spits back minimum
#NOTE...when in console and the beginning of each line is a + sign then something is wrong with script....missing paranthesis...etc. Can end issue by submitting ')' in the console 
#rerun script

r_norm_min <- function(n){
  x<-rnorm(n)
  is_min <- min(x)
  return(is_min)}



#after lunch break

fahrenheit_to_kelvin <- function(temp_F){
  temp_k<-((temp_F-32)*(5/9)+273.15)
  return(temp_k)
  }
boiling_k<-fahrenheit_to_kelvin(212)


kelvin_to_celsius <- function(temp_K){
  temp_c<- temp_K-273.15
  return(temp_c)
}
kelvin_to_celsius(273.15)


fahrenheit_to_celsius <- function (temp_F){
  temp_k<- fahrenheit_to_kelvin(temp_F)
  temp_c<- kelvin_to_celsius(temp_K)
  
  return(temp_c)
}
# can nest functions into one another

# creating vectors

vec<- c(2,3,4)

#on our own - make a function that takes two vectors and return one new vector that is
#composed of a, b, a

highlight <- function(A,B){
vec1 <- A
vec2 <- B
new_vec<-c(vec1,vec2,vec1)
 return(new_vec)
  
}
A<-c(1,2,3)
B<-c(2,4,6)
highlight(A,B)

# challenge 2: design a function called edges, that returns a vector composed of the first and last element of the input vector

edges <- function(cat){
  first_last<-c(cat[1],cat[length(cat)])
  new_vec<-c(first_last,cat,first_last)
  return(new_vec)
  
  
}
vector<-c(1,2,3,4,5,6,8,9,16)


#next section

center <- function(data, midpoint = 0){#putting in midpoint=0 here makes it the default case unless specified later on 
  centered_data <- data-mean(data)+midpoint
  return(centered_data)
  
  
}
example_data<-c(0,0,0,0,0)
center(data=example_data,midpoint=0)
center(data=example_data, midpoint=2) #here we changed the midpoint to 2 

#function applied to earlier data set - inflammation
mean(inf_data$V7)
day_7_mean<-center(data=inf_data$V7)
day_7_mean+mean(inf_data$V7)


# this function will plot avg, max, and min of inflammation over time. Input is a character string of a csv file
analyze<-function(filename){
  
  dat <- read.csv(file = filename, header = F) #header=F or FALSE means that there is no header so dont treat first row as columns
  
  avg_day_inflammation <- apply(X = dat, MARGIN = 2, FUN = mean) #make sure you make captial X
  max_day_inflammation <- apply(X=dat, MARGIN = 2, FUN = max)
  min_day_inflammation <- apply(X=dat, MARGIN = 2, FUN = min)
  
  plot(avg_day_inflammation)
  plot(max_day_inflammation)
  plot(min_day_inflammation)
  
}

testfile<-"/home/nwknoblauch/Public/r-novice-inflammation/data/inflammation-02.csv"
analyze(testfile)
 

#dont want to re-execute for every data set....need to use foreloop

best_practice<-c("let","the","computer","do","the","work")

print_words<-function(sentence){
  for(word in sentence){
    
  print(word)}
  
}
print_words(best_practice
            )
for (i in 1:10){
  a <- 2^i
  print(a)
  
}

# paste is similar to concatenate but puts everything togehter in one string
colors<- c("red", "blue", "green")
for (col in colors){
  print(paste("My favorite Color is", col))}


#Challenge: write a function using a foreloop that computes expoentials - without using exponential function
#exponent(x,n)
Exponents <- function(x,n){
  base <- 1
  for (i in 1:n){
    base <-base*x
    print(base)
  }
  }
Exponents(2,5)

Exponents(2,3)
