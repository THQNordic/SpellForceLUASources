-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 524.025085 , 464.825470 , 97.106400 , 50.099808 , [[Camera:ScriptSplineLookAtPosition(543.749,509.568,70.580);]] )
   Camera:MotionSpline_AddSplinePoint( 540.898926 , 464.825470 , 100.426071 , 14.500019 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 560.553711 , 473.267303 , 105.496384 , 22.800051 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 574.957764 , 490.141998 , 108.444267 , 34.500046 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 583.082458 , 519.669556 , 114.775818 , 49.999809 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 566.211487 , 557.637451 , 109.757156 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 50.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
