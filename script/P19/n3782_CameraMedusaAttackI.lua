-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 291.149475 , 291.702515 , 70.356041 , 50.099808 , [[Camera:ScriptSplineLookAtPosition(321.975,318.308,55.000);]] )
   Camera:MotionSpline_AddSplinePoint( 302.411011 , 291.708008 , 68.057465 , 32.400078 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 316.476532 , 291.714874 , 65.216431 , 49.999809 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 330.444336 , 291.721710 , 66.206696 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 50.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
