# Check if creating a CacheCapital and
# getting its content works fine
data1 <- c("charlie","wilsons","war")
charlie <- makeCacheCapital(data1)
stopifnot(identical(charlie$getc(), data1))
print(data1)

# Check if cacheCapital gives the
# same result for the same input
print(y  <- cacheCapital(charlie))
print("Expecting Cached Message Before Result")
print(y1 <- cacheCapital(charlie))
stopifnot(identical(y, y1))

# Check if cacheCapital gives the same result
# as solve
z <- toupper(data1)

stopifnot(identical(y1, z))

# Check if updating the matrix with
# set works correctly
data2 <- c("conair","nick","cage")
charlie$setc(data2)
print(data2)
stopifnot(identical(charlie$getc(), data2))

# Check if the cache is unvalidated
# after a setc()
print(y <- cacheCapital(charlie))
print("Expecting Cached Message Before Result")
print(y <- cacheCapital(charlie))
z <- toupper(data2)

stopifnot(identical(y, z))

print("Tests Passed")