## Functions that cache the inverse of a matrix
##
## Usage example:
##
## > source('cachematrix.R')
## > m <- makeCacheMatrix(matrix(c(2, 0, 0, 2), c(2, 2)))
## > cacheSolve(m)
## [,1] [,2]
## [1,] 0.5 0.0
## [2,] 0.0 0.5
## Create a special "matrix", which is a list containing
## a function to
## - set the value of the matrix
## - get the value of the matrix
## - set the value of the inverse matrix
## - get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
## Initialize the inverse property
  
i <- NULL
set <- function(y) {
x <<- y
i <<- NULL
}
## get the matrix
  
get <- function() x

## Setting the inverse of the matrix
  
setinverse <- function(inv) i <<- inv

## Getting the inverse of the matrix
  
getinverse <- function() i
## Back a list of the methods
  
list(
set = set,
get = get,
setinverse = setinverse,
getinverse = getinverse
)
}


## Calculating the inverse of the matrix
## function, reusing cached result if it is available
cacheSolve <- function(x, ...) {
i <- x$getinverse()
if(!is.null(i)) {
message("getting cached data")
return(i)
}
m <- x$get()
i <- solve(m, ...)
x$setinverse(i)
i
}
