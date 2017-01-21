## Functions that are able to cache the inverse matrix
## According to the function call of makeCacheMatrix the different
## forms of subsequent function calls of the list members are executed 
## e. g. setInverseMatrix, getInverseMatrix ...

makeCacheMatrix <- function(x = matrix()) {
 inverse <- NULL
 set <- function (y) {
   x <<- y
   inverse <<- NULL
 }
 get <- function () x
 setInverseMatrix <- function (solveMatrix) inverse <<- solveMatrix
 getInverseMatrix <- function () inverse
 list (set=set, get=get, setInverseMatrix = setInverseMatrix, getInverseMatrix=getInverseMatrix)
}


## This function returnes the inverse matrix given by makeCacheMatrix

cacheSolve <- function(x, ...) {
        inverse <- x$getInverseMatrix()
        if(!is.null(inverse)) {
          message("lookup cached data")
          return (inverse)
        }
        data <- x$get()
        inverse <- solve (data)
        x$setInverseMatrix(inverse)
        inverse
}
