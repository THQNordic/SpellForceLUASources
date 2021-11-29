-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 235.884125 , 272.533234 , 17.959539 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(175.662,292.063,13.570);]] )
   Camera:MotionSpline_AddSplinePoint( 235.884125 , 272.533234 , 17.959539 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 235.884125 , 272.533234 , 17.959539 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 235.884125 , 272.533234 , 17.959539 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 6.523438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
