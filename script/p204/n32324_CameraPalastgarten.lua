-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 235.446060 , 472.563110 , 47.291405 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(189.506,509.186,44.781);]] )
   Camera:MotionSpline_AddSplinePoint( 236.687958 , 474.128540 , 47.291405 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 236.687958 , 474.128540 , 47.291405 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 236.687958 , 474.128540 , 47.291405 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
