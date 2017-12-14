# The functions defined in this script create the necessary methods to cache
# the inverse of a matrix. The purpose is to reduce processing time when an
# inverse of a matrix is needed several times on an application.
#
# The "makeCacheMatrix" function creates an object with methods named "set()" and
# "get()" to save and retrieve a matrix. The function also defines the "setSolve()"
# and "getSolve()" methods to save and retrieve the cached inverse of the matrix.
#
# The "cacheSolve" function verifies if a cached value for the inverse already
# exist. If not, it computes the inverse of the original matrix, saves the result
# for future caching and finally retrieves the inverse result.
#
# There are two important assumptions for this code to work without problems:
# 1. The matrix supplied to the functions must be invertible.
# 2. Operations to the matrix that change the matrix values must be always
#    done using the "set()" function, since this function also resets the cached
#    value to NULL.
#

# Function to create a new cacheable matrix inverse object and methods.
makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function()
        x
    setSolve <- function(xsolve)
        s <<- xsolve
    getSolve <- function()
        s
    list(
        set = set,
        get = get,
        setSolve = setSolve,
        getSolve = getSolve
    )
}

# Function to compute and/or retrieve the cached inverse of an stored matrix.
cacheSolve <- function(x, ...) {
    s <- x$getSolve()
    if (!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$setSolve(s)
    s
}
