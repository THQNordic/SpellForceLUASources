-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 247.353821 , 534.532959 , 10.771690 , 19.400038 , [[Camera:ScriptSplineLookAtPosition(258.200,526.555,9.020);]] )
   Camera:MotionSpline_AddSplinePoint( 247.353821 , 534.532959 , 10.771690 , 12.900013 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 247.353821 , 534.532959 , 10.771690 , 19.300037 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 247.353821 , 534.532959 , 10.771690 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
