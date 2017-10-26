library(jsonlite)

source("R/fhirClient.R")

# connect to the server
endpoint <- "http://test.fhir.org/r3"
client <- fhirClient$new(endpoint)

# just get a random patient
a <- client$read(location = "Patient/example", summaryType = "json")
a$identifier

# count Patients with gender = male

b <- client$search("Patient", "gender=male", summaryType="count")
b$total

# now, graphql on a resource
c <- client$readGQL(location = "Patient/example", graphQL = "{id name{given,family}}")
print(c)
