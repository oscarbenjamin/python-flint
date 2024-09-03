from flint.flintlib.fmpz_types cimport fmpz_t, fmpz_poly_struct, fmpz_poly_t
from flint.flintlib.flint cimport flint_bitcnt_t, ulong, mp_limb_t, slong, fmpz_struct, flint_rand_t
from flint.flintlib.mpoly cimport mpoly_ctx_t, ordering_t
from flint.flintlib.fmpz_mod cimport fmpz_mod_ctx_t

cdef extern from "flint/fmpz_mod_mpoly.h":
    ctypedef struct fmpz_mod_mpoly_ctx_struct:
        mpoly_ctx_t minfo
        fmpz_mod_ctx_t ffinfo

    ctypedef fmpz_mod_mpoly_ctx_struct fmpz_mod_mpoly_ctx_t[1]

    ctypedef struct fmpz_mod_mpoly_struct:
        fmpz_struct * coeffs
        ulong * exps
        slong length
        flint_bitcnt_t bits
        slong coeffs_alloc
        slong exps_alloc

    ctypedef fmpz_mod_mpoly_struct fmpz_mod_mpoly_t[1]

    ctypedef struct fmpz_mod_mpoly_univar_struct:
        fmpz_mod_mpoly_struct * coeffs
        fmpz_struct * exps
        slong alloc
        slong length

    ctypedef fmpz_mod_mpoly_univar_struct fmpz_mod_mpoly_univar_t[1]

# from here on is parsed
    void fmpz_mod_mpoly_ctx_init(fmpz_mod_mpoly_ctx_t ctx, slong nvars, const ordering_t ord, const fmpz_t p)
    slong fmpz_mod_mpoly_ctx_nvars(const fmpz_mod_mpoly_ctx_t ctx)
    ordering_t fmpz_mod_mpoly_ctx_ord(const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_ctx_get_modulus(fmpz_t n, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_ctx_clear(fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_init(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_init2(fmpz_mod_mpoly_t A, slong alloc, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_init3(fmpz_mod_mpoly_t A, slong alloc, flint_bitcnt_t bits, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_clear(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    char * fmpz_mod_mpoly_get_str_pretty(const fmpz_mod_mpoly_t A, const char ** x, const fmpz_mod_mpoly_ctx_t ctx)
    # int fmpz_mod_mpoly_fprint_pretty(FILE * file, const fmpz_mod_mpoly_t A, const char ** x, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_print_pretty(const fmpz_mod_mpoly_t A, const char ** x, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_set_str_pretty(fmpz_mod_mpoly_t A, const char * str, const char ** x, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_gen(fmpz_mod_mpoly_t A, slong var, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_is_gen(const fmpz_mod_mpoly_t A, slong var, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_equal(const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_swap(fmpz_mod_mpoly_t poly1, fmpz_mod_mpoly_t poly2, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_is_fmpz(const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_get_fmpz(fmpz_t c, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set_fmpz(fmpz_mod_mpoly_t A, const fmpz_t c, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set_ui(fmpz_mod_mpoly_t A, ulong c, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set_si(fmpz_mod_mpoly_t A, slong c, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_zero(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_one(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_equal_fmpz(const fmpz_mod_mpoly_t A, const fmpz_t c, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_equal_ui(const fmpz_mod_mpoly_t A, ulong c, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_equal_si(const fmpz_mod_mpoly_t A, slong c, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_is_zero(const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_is_one(const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_degrees_fit_si(const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_degrees_fmpz(fmpz_struct ** degs, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_degrees_si(slong * degs, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_degree_fmpz(fmpz_t deg, const fmpz_mod_mpoly_t A, slong var, const fmpz_mod_mpoly_ctx_t ctx)
    slong fmpz_mod_mpoly_degree_si(const fmpz_mod_mpoly_t A, slong var, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_total_degree_fits_si(const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_total_degree_fmpz(fmpz_t tdeg, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    slong fmpz_mod_mpoly_total_degree_si(const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_used_vars(int * used, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_get_coeff_fmpz_monomial(fmpz_t c, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t M, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set_coeff_fmpz_monomial(fmpz_mod_mpoly_t A, const fmpz_t c, const fmpz_mod_mpoly_t M, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_get_coeff_fmpz_fmpz(fmpz_t c, const fmpz_mod_mpoly_t A, fmpz_struct * const * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_get_coeff_fmpz_ui(fmpz_t c, const fmpz_mod_mpoly_t A, const ulong * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set_coeff_fmpz_fmpz(fmpz_mod_mpoly_t A, const fmpz_t c, fmpz_struct * const * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set_coeff_ui_fmpz(fmpz_mod_mpoly_t A, ulong c, fmpz_struct * const * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set_coeff_si_fmpz(fmpz_mod_mpoly_t A, slong c, fmpz_struct * const * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set_coeff_fmpz_ui(fmpz_mod_mpoly_t A, const fmpz_t c, const ulong * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set_coeff_ui_ui(fmpz_mod_mpoly_t A, ulong c, const ulong * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set_coeff_si_ui(fmpz_mod_mpoly_t A, slong c, const ulong * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_get_coeff_vars_ui(fmpz_mod_mpoly_t C, const fmpz_mod_mpoly_t A, const slong * vars, const ulong * exps, slong length, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_cmp(const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_is_canonical(const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    slong fmpz_mod_mpoly_length(const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_resize(fmpz_mod_mpoly_t A, slong new_length, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_get_term_coeff_fmpz(fmpz_t c, const fmpz_mod_mpoly_t A, slong i, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set_term_coeff_fmpz(fmpz_mod_mpoly_t A, slong i, const fmpz_t c, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set_term_coeff_ui(fmpz_mod_mpoly_t A, slong i, ulong c, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set_term_coeff_si(fmpz_mod_mpoly_t A, slong i, slong c, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_term_exp_fits_si(const fmpz_mod_mpoly_t poly, slong i, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_term_exp_fits_ui(const fmpz_mod_mpoly_t poly, slong i, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_get_term_exp_fmpz(fmpz_struct ** exp, const fmpz_mod_mpoly_t A, slong i, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_get_term_exp_ui(ulong * exp, const fmpz_mod_mpoly_t A, slong i, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_get_term_exp_si(slong * exp, const fmpz_mod_mpoly_t A, slong i, const fmpz_mod_mpoly_ctx_t ctx)
    ulong fmpz_mod_mpoly_get_term_var_exp_ui(const fmpz_mod_mpoly_t A, slong i, slong var, const fmpz_mod_mpoly_ctx_t ctx)
    slong fmpz_mod_mpoly_get_term_var_exp_si(const fmpz_mod_mpoly_t A, slong i, slong var, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set_term_exp_fmpz(fmpz_mod_mpoly_t A, slong i, fmpz_struct * const * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_set_term_exp_ui(fmpz_mod_mpoly_t A, slong i, const ulong * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_get_term(fmpz_mod_mpoly_t M, const fmpz_mod_mpoly_t A, slong i, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_get_term_monomial(fmpz_mod_mpoly_t M, const fmpz_mod_mpoly_t A, slong i, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_push_term_fmpz_fmpz(fmpz_mod_mpoly_t A, const fmpz_t c, fmpz_struct * const * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_push_term_fmpz_ffmpz(fmpz_mod_mpoly_t A, const fmpz_t c, const fmpz_struct * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_push_term_ui_fmpz(fmpz_mod_mpoly_t A, ulong c, fmpz_struct * const * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_push_term_ui_ffmpz(fmpz_mod_mpoly_t A, ulong c, const fmpz_struct * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_push_term_si_fmpz(fmpz_mod_mpoly_t A, slong c, fmpz_struct * const * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_push_term_si_ffmpz(fmpz_mod_mpoly_t A, slong c, const fmpz_struct * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_push_term_fmpz_ui(fmpz_mod_mpoly_t A, const fmpz_t c, const ulong * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_push_term_ui_ui(fmpz_mod_mpoly_t A, ulong c, const ulong * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_push_term_si_ui(fmpz_mod_mpoly_t A, slong c, const ulong * exp, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_sort_terms(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_combine_like_terms(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_reverse(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_randtest_bound(fmpz_mod_mpoly_t A, flint_rand_t state, slong length, ulong exp_bound, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_randtest_bounds(fmpz_mod_mpoly_t A, flint_rand_t state, slong length, ulong * exp_bounds, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_randtest_bits(fmpz_mod_mpoly_t A, flint_rand_t state, slong length, mp_limb_t exp_bits, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_add_fmpz(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_t c, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_add_ui(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, ulong c, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_add_si(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, slong c, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_sub_fmpz(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_t c, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_sub_ui(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, ulong c, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_sub_si(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, slong c, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_add(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_t C, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_sub(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_t C, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_neg(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_scalar_mul_fmpz(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_t c, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_scalar_mul_ui(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, ulong c, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_scalar_mul_si(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, slong c, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_scalar_addmul_fmpz(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_t C, const fmpz_t d, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_make_monic(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_derivative(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, slong var, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_evaluate_all_fmpz(fmpz_t eval, const fmpz_mod_mpoly_t A, fmpz_struct * const * vals, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_evaluate_one_fmpz(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, slong var, const fmpz_t val, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_compose_fmpz_poly(fmpz_poly_t A, const fmpz_mod_mpoly_t B, fmpz_poly_struct * const * C, const fmpz_mod_mpoly_ctx_t ctxB)
    int fmpz_mod_mpoly_compose_fmpz_mod_mpoly_geobucket(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, fmpz_mod_mpoly_struct * const * C, const fmpz_mod_mpoly_ctx_t ctxB, const fmpz_mod_mpoly_ctx_t ctxAC)
    int fmpz_mod_mpoly_compose_fmpz_mod_mpoly(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, fmpz_mod_mpoly_struct * const * C, const fmpz_mod_mpoly_ctx_t ctxB, const fmpz_mod_mpoly_ctx_t ctxAC)
    void fmpz_mod_mpoly_compose_fmpz_mod_mpoly_gen(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const slong * c, const fmpz_mod_mpoly_ctx_t ctxB, const fmpz_mod_mpoly_ctx_t ctxAC)
    void fmpz_mod_mpoly_mul(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_t C, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_mul_johnson(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_t C, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_mul_dense(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_t C, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_pow_fmpz(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_t k, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_pow_ui(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, ulong k, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_divides(fmpz_mod_mpoly_t Q, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_div(fmpz_mod_mpoly_t Q, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_divrem(fmpz_mod_mpoly_t Q, fmpz_mod_mpoly_t R, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_divrem_ideal(fmpz_mod_mpoly_struct ** Q, fmpz_mod_mpoly_t R, const fmpz_mod_mpoly_t A, fmpz_mod_mpoly_struct * const * B, slong len, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_term_content(fmpz_mod_mpoly_t M, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_content_vars(fmpz_mod_mpoly_t g, const fmpz_mod_mpoly_t A, slong * vars, slong vars_length, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_gcd(fmpz_mod_mpoly_t G, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_gcd_cofactors(fmpz_mod_mpoly_t G, fmpz_mod_mpoly_t Abar, fmpz_mod_mpoly_t Bbar, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_gcd_brown(fmpz_mod_mpoly_t G, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_gcd_hensel(fmpz_mod_mpoly_t G, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_gcd_subresultant(fmpz_mod_mpoly_t G, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_gcd_zippel(fmpz_mod_mpoly_t G, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_gcd_zippel2(fmpz_mod_mpoly_t G, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_resultant(fmpz_mod_mpoly_t R, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, slong var, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_discriminant(fmpz_mod_mpoly_t D, const fmpz_mod_mpoly_t A, slong var, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_sqrt(fmpz_mod_mpoly_t Q, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_is_square(const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_quadratic_root(fmpz_mod_mpoly_t Q, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_univar_init(fmpz_mod_mpoly_univar_t A, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_univar_clear(fmpz_mod_mpoly_univar_t A, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_univar_swap(fmpz_mod_mpoly_univar_t A, fmpz_mod_mpoly_univar_t B, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_to_univar(fmpz_mod_mpoly_univar_t A, const fmpz_mod_mpoly_t B, slong var, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_from_univar(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_univar_t B, slong var, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_univar_degree_fits_si(const fmpz_mod_mpoly_univar_t A, const fmpz_mod_mpoly_ctx_t ctx)
    slong fmpz_mod_mpoly_univar_length(const fmpz_mod_mpoly_univar_t A, const fmpz_mod_mpoly_ctx_t ctx)
    slong fmpz_mod_mpoly_univar_get_term_exp_si(fmpz_mod_mpoly_univar_t A, slong i, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_univar_get_term_coeff(fmpz_mod_mpoly_t c, const fmpz_mod_mpoly_univar_t A, slong i, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_univar_swap_term_coeff(fmpz_mod_mpoly_t c, fmpz_mod_mpoly_univar_t A, slong i, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_univar_set_coeff_ui(fmpz_mod_mpoly_univar_t Ax, ulong e, const fmpz_mod_mpoly_t c, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_univar_resultant(fmpz_mod_mpoly_t R, const fmpz_mod_mpoly_univar_t Ax, const fmpz_mod_mpoly_univar_t Bx, const fmpz_mod_mpoly_ctx_t ctx)
    int fmpz_mod_mpoly_univar_discriminant(fmpz_mod_mpoly_t D, const fmpz_mod_mpoly_univar_t Ax, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_inflate(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_struct * shift, const fmpz_struct * stride, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_deflate(fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_t B, const fmpz_struct * shift, const fmpz_struct * stride, const fmpz_mod_mpoly_ctx_t ctx)
    void fmpz_mod_mpoly_deflation(fmpz_struct * shift, fmpz_struct * stride, const fmpz_mod_mpoly_t A, const fmpz_mod_mpoly_ctx_t ctx)
