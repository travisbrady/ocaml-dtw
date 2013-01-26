
type ta = (float, Bigarray.float64_elt, Bigarray.c_layout) Bigarray.Array1.t 
(** Finds distance (and index) between [query] and [data] given the warping band
    width.
    returns a (dist, index) pair *)
val ucr_query : query:ta -> data:ta -> warp_band_width:float -> float * int64
