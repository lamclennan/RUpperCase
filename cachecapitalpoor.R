## makeCacheCapital operates as a normal function returning a list. No maintained environment here
## everything collaspses at the end.

makeCacheCapitalPoor <- function(x = character()) {
    ## return a list of with three vectors
    list(data = x, lastdata = character(), cached = NULL)
}

## cacheCapital takes a list of character vectors created with makeCacheCapital
## and returns its capitals either from the cache or computes if not cached.

cacheCapitalPoor <- function(x) {
    ## get the cached result
    c <- x$cahced
    
    ## wasting compute time to check that the current data 
    ## and last cached data is the same (might be quicker not to cache at all in this case)
    ## will never be not null
    if(!is.null(x$cached))
    {
        if(x$data == x$lastdata) {
            message("getting cached data")
            ## Return a cached capital that is the capital of 'x' and end
            return(c)
        }
    }
    data <- x$data
    
    ##run toupper on  data and assing output to c 
    c <- toupper(data)
    
    ## update the last data so we can compare
    ## this does nothing it only updates x in this environment we're not returning x so it is pointless
    ## using <<- does not work either because x is not in the parent environment its only local
    ## it might be called data, charlie etc etc in the parent so no way to know
    ## Wouldnt it be nice to call a function that is aware of an associated environment of x?
    x$lastdata <- x$data
    
    ## update the cache with the uppercase
    ## this does nothing it only updates x in this environment we're not returning x so it is pointless
    ## using <<- does not work either because x is not in the parent environment its only local
    ## it might be called data, charlie etc etc in the parent so no way to know
    ## Wouldnt it be nice to call a function that is aware of an associated environment of x?
    x$cached <- c
    
    ## Return a uppercase of 'x'
    c
}