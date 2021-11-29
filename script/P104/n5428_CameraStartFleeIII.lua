-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 408.570496 , 278.245605 , 25.863909 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(415.643,306.036,25.000);]] )
   Camera:MotionSpline_AddSplinePoint( 412.795380 , 278.836273 , 24.863909 , 5.999997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 418.890015 , 279.694977 , 26.863909 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 425.041962 , 281.336334 , 29.473907 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
