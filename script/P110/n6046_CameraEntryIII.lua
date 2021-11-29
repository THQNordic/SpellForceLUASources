-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 489.118866 , 261.421906 , 66.278351 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(540.713,372.382,10.940);]] )
   Camera:MotionSpline_AddSplinePoint( 521.682922 , 254.870697 , 67.466957 , 12.400011 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 556.683350 , 258.403870 , 66.318359 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 594.079163 , 274.524261 , 66.368347 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
