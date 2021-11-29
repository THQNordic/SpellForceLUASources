-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 242.114746 , 160.595551 , 12.559597 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(249.008,189.083,15.000);
]] )
   Camera:MotionSpline_AddSplinePoint( 242.114746 , 160.595551 , 12.559597 , 10.200003 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 242.114746 , 160.595551 , 12.559597 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 242.114746 , 160.595551 , 12.559597 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
