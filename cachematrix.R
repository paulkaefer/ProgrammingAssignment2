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

## This function sets up the cache matrix object.

makeCacheMatrix <- function(x = matrix()) {

    cacheMatrix <- NULL
    set <- function(inputMatrix) {
        cacheMatrix <<- inputMatrix
        matrixInverse <<- NULL
    }
    get <- function() inputMatrix
    setInverse <- function(inverse) matrixInverse <<- inverse
    getInverse <- function() matrixInverse
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)

}


## This function finds the inverse of the matrix.
## If that's been done before, it will return the cached solution
##   rather than re-computing the inverse.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    cacheInverse <- function(x, ...) {
        inverseMatrix <- x$getInverse()
        if(!is.null(inverseMatrix)) {
            message("Cached inverse found.")
            return(inverseMatrix)
        } else {
            message("Cached inverse not found. Calculating...")
            data <- x$get()
            inverseMatrix <- solve(data, ...)
            x$setInverse(inverseMatrix)
            return(inverseMatrix)
        }
    }
}
