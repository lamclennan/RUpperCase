# Check if creating a CacheCapitalPoor and
# getting its content works fine
data1 <- c("charlie","wilsons","war")
charlie <- makeCacheCapitalPoor(data1)
stopifnot(identical(charlie$data, data1))
print(data1)

# Check if cacheCapitalPoor gives the
# same result for the same input
print(y  <- cacheCapitalPoor(charlie))
print("Expecting Cached Message Before Result")
print(y1 <- cacheCapitalPoor(charlie))
stopifnot(identical(y, y1))

# Check if cacheCapitalPoor gives the same result
# as solve
z <- toupper(data1)

stopifnot(identical(y1, z))

# Check if updating the matrix with
# set works correctly
data2 <- c("conair","nick","cage")
charlie$data <- data2
print(data2)
stopifnot(identical(charlie$data, data2))

# Check if the cache is unvalidated
# after a setc()
print(y <- cacheCapitalPoor(charlie))
print("Expecting Cached Message Before Result")
print(y <- cacheCapitalPoor(charlie))
z <- toupper(data2)

stopifnot(identical(y, z))

print("No cached messages")