-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 163.310760 , 116.276398 , 17.512413 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(162.269,126.222,12);]] )
   Camera:MotionSpline_AddSplinePoint( 160.310989 , 116.313057 , 16.512413 , 10.000002 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 157.324921 , 117.349625 , 15.512413 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 155.352463 , 119.372398 , 14.512413 , 29.700077 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
