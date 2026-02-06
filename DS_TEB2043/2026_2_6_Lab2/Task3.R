name <- readline(prompt = "Enter your name: ")
phone <- readline(prompt = "Enter your phone number: ")

name_upper <- toupper(name)

first_part <- substr(phone, 1, 3)

last_part <- substr(phone, nchar(phone) - 3, nchar(phone))

cat("HI,", name_upper, ". A VERIFICATION CODE HAS BEEN SENT TO", first_part, "-XXXXX", last_part, "\n")
