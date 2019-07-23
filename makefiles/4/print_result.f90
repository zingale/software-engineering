subroutine print_result(result) bind(C, name="print_result")

  use compute_module, only: min_value

  implicit none

  double precision, intent(in) :: result

  print *, result

end subroutine print_result
