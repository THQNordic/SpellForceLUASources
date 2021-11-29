-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 510.025848 , 228.203659 , 44.703388 , 19.900040 , [[Camera:ScriptSplineLookAtNpc(2910);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 507.038147 , 231.184982 , 45.063389 , 12.400011 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 505.544281 , 237.157242 , 44.533390 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 504.053619 , 243.151245 , 44.263386 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
