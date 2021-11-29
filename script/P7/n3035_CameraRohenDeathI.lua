-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 47.118027 , 34.984337 , 72.196365 , 100.199043 , [[Camera:ScriptSplineLookAtPosition(68.459,51.894,45.550);]] )
   Camera:MotionSpline_AddSplinePoint( 54.570004 , 23.907333 , 69.849167 , 62.899612 , [[Camera:ScriptSplineLookAtPosition(230.831,82.823,22.700);]] )
   Camera:MotionSpline_AddSplinePoint( 72.321014 , 26.216316 , 65.306122 , 100.099045 , [[Camera:ScriptSplineLookAtPosition(230.831,82.823,22.700);]] )
   Camera:MotionSpline_AddSplinePoint( 89.292526 , 34.445332 , 61.596329 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(230.831,82.823,22.700);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 100.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
