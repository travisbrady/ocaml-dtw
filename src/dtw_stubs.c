#include <sys/types.h>

#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/mlvalues.h>
#include <caml/bigarray.h>

#include "ucr_dtw.h"

CAMLprim value
caml_ucr_query(value query, value data, value r) {
    CAMLparam3(query, data, r);
    CAMLlocal3(out, outind, outval);

    int32_t m = (int32_t)Bigarray_val(query)->dim[0];
    int32_t vlen = (int32_t)Bigarray_val(data)->dim[0];

    struct ucr_index *result;
    result = (struct ucr_index*)malloc(sizeof(struct ucr_index) * m);

    double* qd = Data_bigarray_val(query);
    double* vd = Data_bigarray_val(data);
    int32_t e = ucr_query(qd, m, Double_val(r), vd, vlen, result);

    out = caml_alloc_tuple(2);
    outind = caml_copy_int64((int64_t) result->index);
    outval = caml_copy_double((double) result->value);
    free(result);

    Store_field(out, 0, outval);
    Store_field(out, 1, outind);

    CAMLreturn(out);
}

