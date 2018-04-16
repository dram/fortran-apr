program main
  use iso_c_binding

  implicit none

  block
    use apr

    type(c_ptr) pool, cptr
    type(apr_array_header_t), pointer :: fptr
    integer(c_int) i

    i = apr_pool_initialize()
    print *, "apr_pool_initialize", i

    i = apr_pool_create_ex(pool, c_null_ptr, c_null_ptr, c_null_ptr)
    print *, "apr_pool_create_ex", i

    block
      character(:), allocatable, target :: pattern
      pattern = "sources/*.f90" // char(0)
      i = apr_match_glob(c_loc(pattern), cptr, pool)
    end block
    print *, "apr_match_glob", i

    call c_f_pointer(cptr, fptr)

    block
      integer i
      type(c_ptr), pointer :: entries (:)
      character(7), pointer :: name

      call c_f_pointer(fptr % elts, entries, [fptr % nelts])
      do i = 1, size(entries)
         call c_f_pointer(entries(i), name)
         print *, name
      end do
    end block

    call apr_pool_clear(pool)

    call apr_pool_terminate()
  end block
end program main
