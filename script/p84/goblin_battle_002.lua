-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 162.475784 , 123.306114 , 14.633438 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(162.314,128.653,9);]] )
   Camera:MotionSpline_AddSplinePoint( 159.757370 , 125.592072 , 17.633438 , 8.599997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 159.330856 , 129.105652 , 21.793438 , 12.200010 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 162.197220 , 131.555847 , 24.813438 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 164.618988 , 130.815674 , 27.053438 , 12.200010 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
