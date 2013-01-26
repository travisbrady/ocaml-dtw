open Printf
module B = Bigarray.Array1


let get_line fh =
    try
        Some (input_line fh)
    with End_of_file ->
        None

let get_data fn =
    let fh = open_in fn in
    let rec go lst =
        match get_line fh with
        | Some line -> 
                go ((float_of_string line)::lst)
        | None -> List.rev lst
    in
    let float_list = go [] in
    B.of_array Bigarray.float64 Bigarray.c_layout (Array.of_list float_list)

let () =
    let dfn = Sys.argv.(1) in
    let qfn = Sys.argv.(2) in
    let r = float_of_string Sys.argv.(3) in
    let query = get_data qfn in
    printf "got query %d\n" (B.dim query);
    let data = get_data dfn in
    printf "got data %d\n" (B.dim data);
    if (B.dim query) > (B.dim data) 
    then failwith "Num values in query file must be <= num values in data file"
    else ();
    flush_all();
    let dist,idx = Dtw.ucr_query query data r in
    printf "Location: %Lu\n" idx;
    printf "DTW Dist: %f\n" dist;
    ()

