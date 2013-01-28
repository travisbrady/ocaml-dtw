# OCaml DTW

OCaml Bindings to [Libdtw](https://github.com/b/libdtw) which is itself a fork of Keogh's original UCR_DTW.cpp [UCR Suite](http://www.cs.ucr.edu/~eamonn/UCRsuite.html)

Only a single function `ucr_query` is available which can be called like so:

```ocaml
(* query is our needle and data the haystack. r is the warping constraint which must be between 0 and 1 *)
let dist,idx = Dtw.ucr_query query data r in
Printf.printf "Dist: %f Idx: %d\n" dist idx;
```

Dist is the DTW distance and idx the index in the `data` array where the query was first detected.

## Examples
The dtw_file_query.ml contains a fairly comprehensive example meant to mimic the behavior of Keogh's UCR_DTW.cpp.
It takes paths to a data file, query file and warping constraint via argv and then computes the DTW distance between the data and query files.
One notable difference from Keogh's original: dtw_file_query.ml expects a column of points in a text file as opposed to a single line of space-delimited values.

Usage of `dtw_file_query`:
```
$  ./dtw_file_query.native data/data_column.txt data/query_column.txt 0.05
got query 128
got data 1000000
Location: 756562
DTW Dist: 3.775621
```

## References:
- [Mining Time-series with Trillions of Points: Dynamic Time Warping at scale](http://practicalquant.blogspot.com/2012/10/mining-time-series-with-trillions-of.html)
- [Dynamic Time Warping for Sequence Comparison](http://jeremykun.com/2012/07/25/dynamic-time-warping/)
