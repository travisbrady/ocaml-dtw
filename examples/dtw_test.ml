open Printf
module B = Bigarray.Array1

let () =
    let data = B.of_array Bigarray.float64 Bigarray.c_layout 
        [|1.0; 2.0; 3.0; 5.0; 9.0; 15.0; 22.0|] in
    let query = B.of_array Bigarray.float64 Bigarray.c_layout
        [|3.0; 5.0; 9.0; 15.0; 32.0|] in

    let r = 0.05 in
    let res = Dtw.ucr_query query data r in
    printf "Value: %f Ind: %Ld\n" (fst res) (snd res);
    ()

