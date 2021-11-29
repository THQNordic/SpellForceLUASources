-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 525.894104 , 316.097168 , 40.416481 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(548.209,296.899,24.640);]] )
   Camera:MotionSpline_AddSplinePoint( 525.894104 , 316.097168 , 40.416496 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 525.894104 , 316.097168 , 40.416496 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 525.894104 , 316.097168 , 40.416496 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
