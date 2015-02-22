### Paul's cachematrix code

Functions on matrices are prolific and can be costly as matrix size increases.
If we can speed up computation time, we can improve performance.
These functions build a matrix object that can cache the inverse matrix.
This means that we only have to generate the inverse once for a given matrix, and can save it for later.

### Assumptions

It is assumed that the matrix passed in to the functions is invertible.

### Functions available

1.  `makeCacheMatrix`: Creates "matrix" object with field for cached inverse matrix.
2.  `cacheSolve`: Calculates inverse of matrix or retrieves it from cache (if available).


