-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 159.174606 , 123.985878 , 11.053167 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(160.868,127.073,10.500);]] )
   Camera:MotionSpline_AddSplinePoint( 159.174606 , 123.985878 , 11.053167 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 159.174606 , 123.985878 , 11.053167 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 159.174606 , 123.985878 , 11.053167 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
