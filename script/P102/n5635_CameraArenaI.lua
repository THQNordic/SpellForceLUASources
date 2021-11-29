-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 251.520157 , 480.824768 , 41.793877 , 46.699860 , [[Camera:ScriptSplineLookAtPosition(262.822,516.779,13.320);]] )
   Camera:MotionSpline_AddSplinePoint( 269.183777 , 484.076477 , 41.453915 , 26.200064 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 290.691895 , 494.374298 , 42.583668 , 46.599861 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 308.965790 , 521.389648 , 41.463940 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 45.000000 )
   Camera:MotionSpline_SetCorrection( -2.539063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
