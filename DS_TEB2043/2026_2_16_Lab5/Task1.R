year <- 2004

if ((year %% 400 == 0) || (year %% 4 == 0 && year %% 100 != 0)) {
  cat(year, "is a leap year.\n")
} else {
  cat(year, "is not a leap year.\n")
}