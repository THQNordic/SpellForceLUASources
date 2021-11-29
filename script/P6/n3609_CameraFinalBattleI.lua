-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 571.661987 , 391.112396 , 17.894705 , 19.900040 , [[Camera:ScriptSplineLookAtNpc(3609);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 573.047974 , 382.605865 , 17.844719 , 11.200006 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 580.236755 , 350.915955 , 17.025387 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 587.893372 , 316.354889 , 16.054705 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
