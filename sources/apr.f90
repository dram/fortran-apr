module apr
  use iso_c_binding

  implicit none

  include "constants.f90"

  type, bind(c) :: apr_array_header_t
     type(c_ptr) pool
     integer(c_int) elt_size, nelts, nalloc
     type(c_ptr) elts
  end type apr_array_header_t

  interface
     function apr_array_pop(arr) bind(c)
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: arr
       type(c_ptr) apr_array_pop
     end function apr_array_pop

     function apr_match_glob(dir_pattern, result, p) bind(c)
       use iso_c_binding, only: c_char, c_int, c_ptr
       character(c_char), intent(in) :: dir_pattern (*)
       type(c_ptr), intent(out) :: result
       type(c_ptr), value :: p
       integer(c_int) apr_match_glob
     end function apr_match_glob

     subroutine apr_pool_clear(p) bind(c)
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: p
     end subroutine apr_pool_clear

     function apr_pool_create_ex(newpool, parent, abort_fn, allocator) bind(c)
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), intent(out) :: newpool
       type(c_ptr), value :: parent, abort_fn, allocator
       integer(c_int) apr_pool_create_ex
     end function apr_pool_create_ex

     function apr_pool_initialize() bind(c)
       use iso_c_binding, only: c_int
       integer(c_int) apr_pool_initialize
     end function apr_pool_initialize

     subroutine apr_pool_terminate() bind(c)
     end subroutine apr_pool_terminate
  end interface
end module apr
