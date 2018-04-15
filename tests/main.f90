program main
  use iso_c_binding

  implicit none

  block
    use apr

    type(c_ptr) pool, array
    integer(c_int) i

    i = apr_pool_initialize()
    print *, "apr_pool_initialize", i

    i = apr_pool_create_ex(pool, c_null_ptr, c_null_ptr, c_null_ptr)
    print *, "apr_pool_create_ex", i

    i = apr_match_glob('sources/*.f90', array, pool)
    print *, "apr_match_glob", i

    call apr_pool_clear(pool)

    call apr_pool_terminate()
  end block
end program main
