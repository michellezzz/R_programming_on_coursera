# How to use:
# source("cachematrix.R")
# my_mat<-matrix(1:4, 2,2)
# a<-makeCacheMatrix(my_mat)
# cacheSolve(a)
# a$getinv()



# create a list of functions
# store the matrix x
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) 
    {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(inver) inv <<- inver
    getinv <- function() inv
    list(set = set,  # for setting the matrix
         get = get,   # for getting the matrix
         setinv = setinv,  # for setting the inverse
         getinv = getinv  # for getting the inverse
        )
}

# calculate the inverse of the matrix stored in x
cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if(!is.null(inv))
    {
        message("getting cached matrix")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x <- x$setinv(inv)
    inv
}
