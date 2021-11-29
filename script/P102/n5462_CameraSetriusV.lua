-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 125.196091 , 36.325989 , 24.955088 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(127.722,75.740,12.370);]] )
   Camera:MotionSpline_AddSplinePoint( 141.577637 , 42.157303 , 24.309483 , 8.199995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 153.594986 , 52.114937 , 23.875015 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 159.544189 , 77.756752 , 17.880198 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
