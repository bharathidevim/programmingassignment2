## Put comments here that give an overall description of what your
## functions do



makeCacheMatrix creates a special "matrix", which is really a list containing a function to set /get the value of the matrix and set /get the value of the inversion
makeCacheMatrix <- function(x) {

m <- NULL

set <- function(y){
x <<- y
m <<- NULL
}

get <-function() x

setinvr <- function(invr) m <- invr

getinvr <- function() m

list (set = set, get = get, setinvr = setinvr, getinvr = getinvr)

}

this function calculates the inversion of the special "matrix" created with the above function. However, it first checks to see if the inversion has already been calculated. If so, it gets the mean from the cache and skips the computation. If not, it calculates the inversion of the data and sets the value of the mean in the cache via the setinvr function.
cacheSolve <- function(x,...) {

Return a matrix that is the inverse of 'x'
m <- x$getinvr()
if (! is.null(m)){
message("The matrix inversion cache")
return(m)
}
matrix <- x$get()
m <- solve(matrix)
x$setinvr(m)
m
}