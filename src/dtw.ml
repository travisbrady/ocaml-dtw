module B=Bigarray.Array1

type ta = (float, Bigarray.float64_elt, Bigarray.c_layout) B.t 

external _ucr_query: ta ->  ta -> float -> float * int64 = "caml_ucr_query"

let ucr_query ~(query:ta) ~(data:ta) ~(warp_band_width:float) =
    if (B.dim query) > (B.dim data) 
    then failwith "Num values in query must be <= num values in data"
    else if warp_band_width >= 1.0
    then failwith "warp_band_width must satisfy 0 < warp_band_width < 1"
    else _ucr_query query data warp_band_width

