! Outline of how to use neural fortran

module example_nn

! -------- NEURAL-FORTRAN --------
use mod_kinds, only: ik, rk
use mod_network , only: network_type
use mod_ensemble, only: ensemble_type
! --------------------------------

  implicit none
  save 

  private  

#ifdef ENSEMBLE
  type(ensemble_type) :: example_ensemble
#else
  type(network_type) :: example_nn
#endif


  public get_output, init_model
  contains

  subroutine get_output (inputs)
  ! allocate inputs and outputs 
  
#ifdef ENSEMBLE
    output = example_ensemble % average(input)
#else
    ! use neural fortran library
    output = example_nn % output(input)
#endif

  end subroutine get_output


  subroutine init_model()    

#ifdef ENSEMBLE
    ! loading all models in Models/
    example_ensemble = ensemble_type('./Models/')
#else
    ! Loading a single network from model.txt
    call example_nn % load('./keras_matrices/model.txt')
#endif

  end subroutine init_model

end module example_nn
