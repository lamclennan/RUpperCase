## Assign 2 Example other than mean (do not use this a template mean is better)
## makeCacheCapital and cacheCapital work together to create a  special character
## and cache its capital to save compute time.

## makeCacheCapital takes one numeric input and returns a list of functions
## essentially creating a special character that can cache its uppercase
makeCacheCapital <- function(x = character()) {
    ## set  c to null (creates c as a local varible in the environment else the 
    ## child functions would keep searching beyond this environment)
    c <- NULL
    
    ##create function setchar taking y as an input
    setchar <- function(y) {
        ## because this fuction is writing to its parent we are going to have a function
        ## closure so the parent enviroment is going ot maintain the values of c and x
        
        ##set x to y in the parent environment/closure
        x <<- y
        ## set c to null in the parent environment/closure
        c <<- NULL
    }
    
    ## create function getchar that returns x
    getchar <- function() 
    {
        x
    }
    
    ## create function setcapital that takes capital as an input
    ## and set c to capital in the parent environment
    setcapital <- function(capital)
    {
        c <<- capital
    }
    ## create function getcapital that returns c
    getcapital <- function()
    {
        c
    }
    ## return a named list of our fuctions
    ## I changed the names in the list here just to demonstrate you could do this
    ## Because we are returning these functions that are reading varibles in makeCacheCapital
    ## we will end up with a function closure and the values of x and c will be maintained.
    ## everytime this is assigned a new enviroment is created with the object it is assigned
    ## see https://darrenjw.wordpress.com/2011/11/23/lexical-scope-and-function-closures-in-r/
    ## specifically "Function Closures"
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
    
    ## set data to the result of the getc function
    data <- x$getc()
    
    ##run toupper on  data and assing output to c 
    c <- toupper(data)
    
    ## update the cache with the uppercase
    x$setcap(c)
    
    ## Return a character vector that is the uppercase of 'x'
    c
}
