## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  #Set inv variable to null
  inv <- NULL
  #Define function for matrix
  set <- function(y) { 
    #Set the value
    x <<- y 
    #Clear cache
    inv <<- NULL 
  }
  #Define function for value of matrix
  get <- function() x
  #Define function to set inverse
  setinverse <- function(inverse) inv <<- inverse
  #Define function to get inverse
  getinverse <- function() inv
  #Return list
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  #Fetch cache value for inverse
  inv <- x$getinverse()
  #Return cache value if cache is not null
  if(!is.null(inv)) {
    message("getting cached data.")
    return(inv)
  }
  #Get value of matrix
  data <- x$get()
  #Calculate inverse
  inv <- solve(data)
  #Cache the result
  x$setinverse(inv)
  #Return the inverse
  inv
}
