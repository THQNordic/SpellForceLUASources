-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 120.847900 , 189.338028 , 26.070719 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(96.857,162.718,20.000);]] )
   Camera:MotionSpline_AddSplinePoint( 119.489670 , 187.869949 , 26.070719 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 118.131439 , 186.401871 , 26.070719 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 116.773209 , 184.933792 , 26.070719 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
