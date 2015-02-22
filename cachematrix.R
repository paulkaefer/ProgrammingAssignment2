## cachematrix.R
##
## Functions that create a matrix object with a cacheable inverse value.
## In other words, rather than having to re-compute the inverse every time it is needed,
##  the value is stored in the object.
##
## Forked from https://github.com/rdpeng/ProgrammingAssignment2 for the R Programming 
##  online course (https://class.coursera.org/rprog-011).
##
## Paul Kaefer, February 2015

## To run this, do the following in R:
##
##    1. source("cachematrix.R") to load the code
##
##    2. cacheSolve(yourMatrix)

## This function sets up the cache matrix object.

makeCacheMatrix <- function(x = matrix()) {

    ## initialize the cacheMatrix object
    cacheMatrix <- NULL
    
    ## function to set the value of the matrix
    set <- function(inputMatrix) {
        cacheMatrix <<- inputMatrix
        ## if we set the original matrix, we should clear the inverse value
        ## this way if we ever change the input matrix, there's no risk
        ##  of an out-of-date cached inverse
        matrixInverse <<- NULL
    }
    # simple getting and setting methods, based on the example from the original README file
    get <- function() cacheMatrix
    setInverse <- function(inverse) matrixInverse <<- inverse
    getInverse <- function() matrixInverse
    
    ## I'm not entirely sure why we need this. The code doesn't work without it. Still investigating...
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)

}


## This function finds the inverse of the matrix.
## If that's been done before, it will return the cached solution
##   rather than re-computing the inverse.

cacheSolve <- function(x, ...) {
    ## Returns a matrix that is the inverse of 'x'
    
    # make a cacheMatrix object
    cacheMatrix <- makeCacheMatrix()
    ## initialize it to have x as the input matrix
    cacheMatrix$set(x)
    inverseMatrix <- cacheMatrix$getInverse()
    
    ## if we found a cached version, return that
    ## otherwise calculate it and put it in the cache
    if(!is.null(inverseMatrix)) {
        message("Cached inverse found.")
        return(inverseMatrix)
    } else {
        message("Cached inverse not found. Calculating...")
        data <- cacheMatrix$get()
        inverseMatrix <- solve(data, ...)
        cacheMatrix$setInverse(inverseMatrix)
        return(inverseMatrix)
    }
}
