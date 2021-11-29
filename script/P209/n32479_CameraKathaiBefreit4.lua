-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 521.992188 , 329.613922 , 31.533230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(523.904,350.968,11.000);]] )
   Camera:MotionSpline_AddSplinePoint( 521.992188 , 329.613922 , 31.533230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(523.904,350.968,11.000);]] )
   Camera:MotionSpline_AddSplinePoint( 521.992188 , 329.613922 , 31.533230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(523.904,350.968,11.000);]] )
   Camera:MotionSpline_AddSplinePoint( 521.992188 , 329.613922 , 31.533230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(523.904,350.968,11.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
