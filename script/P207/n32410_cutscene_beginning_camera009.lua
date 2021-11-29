-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 484.350006 , 145.000000 , 96.400002 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(484.350,171.000,92.000);]] )
   Camera:MotionSpline_AddSplinePoint( 484.350006 , 146.000000 , 96.400002 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 484.350006 , 147.000000 , 96.400002 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 484.350006 , 148.000000 , 96.400002 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
