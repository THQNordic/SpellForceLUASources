-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 484.340790 , 154.500000 , 95.400002 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(484.500,151.000,95.300);]] )
   Camera:MotionSpline_AddSplinePoint( 484.350006 , 154.000000 , 95.400002 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 484.350006 , 153.500000 , 95.400002 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 484.350006 , 153.000000 , 95.400002 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
