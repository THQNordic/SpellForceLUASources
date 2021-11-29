-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 432.826965 , 256.433044 , 38.468826 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(416.842,306.598,25.000);]] )
   Camera:MotionSpline_AddSplinePoint( 429.200653 , 255.245270 , 38.678825 , 5.599997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 423.819183 , 252.430328 , 38.898823 , 9.800001 , [[Camera:ScriptSplineLookAtPosition(349.278,268.514,32.880);
Camera:ScriptSplineLookAtApproachingModifier(0.05);]] )
   Camera:MotionSpline_AddSplinePoint( 413.767029 , 245.464478 , 38.698830 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
