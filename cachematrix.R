## makeCacheMatrix creates a cache entry for the matrix and inverse of it

## the names are self descriptive 
## x is the matrix reference passed in the argument 

makeCacheMatrix <- function(x = matrix()) {
        mat <- NULL
        set <- function(y) {
                x <<- y
                mat <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) mat <<- inverse
        getinverse <- function() mat
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function
## solve(datamatrix) has 1 argument, leaving 2nd argument blank calculates its inverse



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inversematrix <- x$getinverse()
        if(!is.null(inversematrix)) {
                message("getting cached data")
                return(inversematrix)
        }
        datamatrix <- x$get()
        inversematrix <- solve(datamatrix)
        x$setinverse(inversematrix)
        inversematrix
        
}
#To Create Matrix object
myMat <- makeCacheMatrix(cbind(c(11,3),c(4,5)))
# To calculate inverted
cacheSolve(myMat)