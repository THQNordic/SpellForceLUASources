-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 562.950684 , 241.499039 , 14.339275 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(569.033,225.617,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 562.950684 , 229.499039 , 14.339275 , 6.499996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 562.950684 , 218.499039 , 14.339275 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 562.950684 , 210.499039 , 14.339275 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
