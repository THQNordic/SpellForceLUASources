-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 526.598816 , 419.112244 , 16.655024 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(516.380,446.200,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 525.495117 , 422.767029 , 16.515026 , 12.200010 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 523.759583 , 427.813080 , 16.515024 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 520.904053 , 433.834259 , 16.515024 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
