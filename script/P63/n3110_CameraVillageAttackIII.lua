-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 443.490845 , 248.562775 , 50.979889 , 11.900009 , [[Camera:ScriptSplineLookAtNpc(3110);]] )
   Camera:MotionSpline_AddSplinePoint( 444.090057 , 253.928955 , 51.119873 , 6.499996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 442.523010 , 259.185730 , 50.959869 , 11.800009 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 438.369751 , 266.888184 , 50.779869 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
