# The following script validates with a series of test the methods created in
# "cachematrix.R"

if(!exists("makeCacheMatrix", mode="function")) source("cachematrix.R")

# Code testing: View sample square invertible matrix and its inverse value
validationMatrixValue <- matrix(c(1,2,3,4),2,2)
print(validationMatrixValue)
validationMatrixInverse <- solve(validationMatrixValue)
print(validationMatrixInverse)

# Code testing: Create empty matrix with makeCacheMatrix function
m1 <- makeCacheMatrix()
print(m1$get())
print(m1$getSolve())

# Code testing: Test set and get functions
m1$set(matrix(c(1,2,3,4),2,2))
print(m1$get())
print(m1$getSolve())

# Code testing: Test cacheSolve, setSolve and getSolve functions
print(cacheSolve(m1))
print(cacheSolve(m1))
print(cacheSolve(m1))

# Code testing: Assign new value to verify cache reset
m1$set(matrix(c(1,0,5,2,1,6,3,4,0),3,3))
print(m1$get())
print(cacheSolve(m1))
print(cacheSolve(m1))
