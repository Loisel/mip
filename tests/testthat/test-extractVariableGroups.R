context("extractVariableGroups Test")

test_that("check that extractVariableGroups correctly extracts variable groups", {
  x1 <- c("a|+|1|+|aa",
         "a|+|2|abc",
         "a|+|1|+|bb",
         "a|+|1|+|cc",
         "a|+|3|+|aa",
         "a|+|3|+|bb",
         "a",
         "a|+|3",
         "a|++|bla",
         "a|++|blu",
         "a|+++|ble",
         "a|+++|blet")

  x2 <- c("a|+|1|+|aa",
         "a|+|2|abc",
         "a|+|1|+|bb",
         "a|+|1|+|cc",
         "a|+|3|+|aa",
         "a|+|3|+|bb",
         "a",
         "a2",
         "a|+|3",
         "a2|+|bla",
         "a2|+|blu",
         "a3|++|ble",
         "a3|++|blet")
  
  res1 <- list("a"=c("a|+|1|+|aa","a|+|2|abc","a|+|1|+|bb","a|+|1|+|cc","a|+|3|+|aa","a|+|3|+|bb","a|+|3"),
              "a|+|1"=c("a|+|1|+|aa","a|+|1|+|bb","a|+|1|+|cc"),
              "a|+|3"=c("a|+|3|+|aa","a|+|3|+|bb"),
              "a 2"=c("a|++|bla","a|++|blu"),
              "a 3"=c("a|+++|ble" ,"a|+++|blet"))

  res2 <- list("a"=c("a|+|1|+|aa","a|+|2|abc","a|+|1|+|bb","a|+|1|+|cc","a|+|3|+|aa","a|+|3|+|bb","a|+|3"),
               "a|+|1"=c("a|+|1|+|aa","a|+|1|+|bb","a|+|1|+|cc"),
               "a|+|3"=c("a|+|3|+|aa","a|+|3|+|bb"),
               "a2"=c("a2|+|bla","a2|+|blu"),
               "a3"=c("a3|++|ble" ,"a3|++|blet"))
  
  expect_mapequal(extractVariableGroups(x1),res1)
  expect_mapequal(extractVariableGroups(x2,keepOrigNames = T),res2)
  

})