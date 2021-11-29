-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 574.770386 , 212.840179 , 11.695768 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(568.190,223.206,23.557);]] )
   Camera:MotionSpline_AddSplinePoint( 574.770386 , 212.840179 , 11.695768 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 574.770386 , 212.840179 , 11.695768 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 574.770386 , 212.840179 , 11.695768 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 60.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
