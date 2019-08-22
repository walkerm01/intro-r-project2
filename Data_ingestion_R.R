#My first R script
#NWK 8-22-2019

my_data <- read.csv("/home/nwknoblauch/Public/r-novice-inflammation/data/car-speeds.csv")

# <- assigns variables names

#control enter on line executes line in script

my_data$Speed

# '$' gives access to different parts of the data frame...capitalization after $ is important

head(my_data)

# 'head' gives access to first 6 frames of data set

max(my_data$Speed)
min(my_data$Speed)


max_speed <- max(my_data$Speed)
min_speed <- min(my_data$Speed)
speed_range <- max_speed - min_speed


# load new data set

inf_data <- read.csv("/home/nwknoblauch/Public/r-novice-inflammation/data/inflammation-01.csv", header = FALSE)

str(inf_data)

# str gives summary of data

inf_head <- inf_data[1:5,1:3]

# brackets give us access to parts of data...[row range, column range]

plot(inf_data[,2])

#plot will plot a scatterplot graph...[,2] gives access to data set in the 2nd column without assigning row

patient_1 <- inf_data[1,]
day_1 <- inf_data[,1]
day_2 <- inf_data[,2]

# note that rows are patients and columns are inflammation scores by days

max_inf <- max(day_1
               )

min(day_1 == 1)
min(day_1 == 0)

# '==' indicates a true/false statement - output will be true or false but will be binary 1 or 0??

day_2[day_2 == 0]

day_3 <- inf_data[,3]

day_3_nonzero <- day_3[0 != day_3]

# != is notation for 'not equal to'

day_3_zero <- day_3[day_3 == 0]
allday_3_zero <- inf_data[day_3 == 0, ]

min(inf_data[,7])

min_inf_day<-apply(inf_data, MARGIN = 2,FUN = min)

# Apply will execute a certain function repetedly on all given parameters...for MARGIN (row is 1 column is 2)...Fun is function and we were looking for min
# So overall we are applying minimum search over all columns across all days

plot(min_inf_day)

max_inf_day<-apply(inf_data,MARGIN = 2,FUN = max)

plot(max_inf_day)

plot(max_inf_day, min_inf_day)

