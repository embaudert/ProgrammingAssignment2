## With this functions you will be able to create a matrix and cache its inverse, so it only needs to be inverted once for every unchanged matrix

## With this function you create and modify the matrix. The same object stores the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(m) {
    x <<- m
    i <<- NULL
  }
  get <- function() x
  setInverse <- function(inv) i <<- inv
  getInverse <- function() i
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## this function checks whether the given matrix already has a cached inverse and calculates it otherwise

cacheSolve <- function(x, ...) {
  i <- x$getInverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setInverse(i)
  i
        ## Return a matrix that is the inverse of 'x'
}
