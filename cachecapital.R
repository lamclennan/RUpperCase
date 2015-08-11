## Assign 2 Example other than mean (do not use this a template mean is better)
## makeCacheCapital and cacheCapital work together to create a  special character
## and cache its capital to save compute time.

## makeCacheCapital takes one numeric input and returns a list of functions
## essentially creating a special character that can cache its uppercase
makeCacheCapital <- function(x = character()) {
    ##set  c to null
    c <- NULL
    
    ##create function setchar taking y as an input
    setchar <- function(y) {
        ## because this fuction is writing to its parent we are going to have a function
        ## closure so the parent enviroment is going ot maintain the values of c and x
        ##set x to y in the parent enviroment/closure
        x <<- y
        ## set c to null in the parent enviroment/closure
        c <<- NULL
    }
    
    ## create function getchar that returns x
    getchar <- function() 
    {
        x
    }
    
    ## create function setcapital that takes inverse as an input
    ## and set c to inverse in the parent enviroment
    setcapital <- function(capital)
    {
        c <<- capital
    }
    ## create function getinverse that returns i
    getcapital <- function()
    {
        c
    }
    ## return a named list of our fuctions
    list(setc = setchar, getc = getchar,
         setcap = setcapital,
         getcap = getcapital)
}


## cacheCapital takes a special character created with makeCacheCapital
## and returns its capitals either from the cache or computes if not cached.

cacheCapital <- function(x) {
    ## get the cached result
    c <- x$getcap()
    
    ## if c/cached result is not null then
    if(!is.null(c)) {
        message("getting cached data")
        ## Return a cached capital that is the capital of 'x' and end
        return(c)
    }
    
    ## set data to the 
    data <- x$getc()
    
    ##run toupper on  data and assing output to c 
    c <- toupper(data)
    
    ## update the cache with the uppercase
    x$setcap(c)
    
    ## Return a character vector that is the uppercase of 'x'
    c
}
