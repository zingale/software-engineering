module compute_module

  implicit none

  double precision, save :: min_value

contains
  subroutine compute(x, y, z) bind(C, name="compute")

    double precision, intent(in) :: x, y
    double precision, intent(out) :: z

    min_value = min(x,y)
    z = x + y

  end subroutine compute
end module compute_module
