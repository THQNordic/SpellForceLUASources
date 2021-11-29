-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 382.538330 , 57.886715 , 90.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(385.164,60.462,89.600);]] )
   Camera:MotionSpline_AddSplinePoint( 382.538330 , 57.886715 , 90.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 382.538330 , 57.886715 , 90.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 382.538330 , 57.886715 , 90.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
