-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 134.831116 , 419.225128 , 40.028984 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(187.301,411.306,30.190);]] )
   Camera:MotionSpline_AddSplinePoint( 144.761627 , 409.250000 , 38.939117 , 8.999998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 155.096268 , 396.488190 , 38.079021 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 170.999664 , 384.557495 , 36.769009 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
