-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 366.922577 , 532.596863 , 27.720146 , 19.700039 , [[Camera:ScriptSplineLookAtNpc(2016);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.5);]] )
   Camera:MotionSpline_AddSplinePoint( 367.187347 , 533.669128 , 27.540146 , 13.000013 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 367.218353 , 535.847839 , 27.540146 , 19.600039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 366.744720 , 537.404907 , 27.060162 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
