## Functions which return the inverse of a matrix by first identifying
## if the matrix has already been solved and stored.

## Function which creates a "matrix" object that can cache its inverse

makeCacheMatrix <- function(X = matrix()) {
M <- NULL
set <- function(Y) {
  X <- Y  
  M <<- NULL
}
get <- function() X
setinverse <- function(inverse) M <<- inverse
getinverse <- function() M
list(set = set, get = get, 
     setinverse = setinverse,
     getinverse = getinverse)
}


## Computes the inverse of the special "matrix" object
## returned by previous function

cacheSolve <- function(X, ...) {
        ## Return a matrix that is the inverse of 'x'
M <- X$getinverse()
if(!is.null(M)) {
  message("getting cached data")
  return(M)
}
data <- X$get()
M <- solve(data)
X$setinverse(M)
M
}
