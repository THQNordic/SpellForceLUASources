-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 396.899200 , 198.504303 , 31.136780 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(360.854,198.609,17.000);]] )
   Camera:MotionSpline_AddSplinePoint( 396.899200 , 198.504303 , 31.136780 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(360.854,198.609,17.000);]] )
   Camera:MotionSpline_AddSplinePoint( 396.899200 , 198.504303 , 31.136780 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(360.854,198.609,17.000);]] )
   Camera:MotionSpline_AddSplinePoint( 396.899200 , 198.504303 , 31.136780 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(360.854,198.609,17.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
