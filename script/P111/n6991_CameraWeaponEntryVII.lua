-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 349.149323 , 422.220825 , 42.472343 , 19.800039 , [[Camera:ScriptSplineLookAtPosition(355.049,425.134,41.546);]] )
   Camera:MotionSpline_AddSplinePoint( 350.065796 , 420.669769 , 42.322433 , 12.700012 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 351.105103 , 419.192261 , 41.172344 , 19.700039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 352.446594 , 417.891876 , 41.032341 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
