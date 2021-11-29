-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 194.584976 , 547.133972 , 73.073227 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(195.166,563.115,65.000);]] )
   Camera:MotionSpline_AddSplinePoint( 196.854172 , 548.297363 , 73.023232 , 8.199995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 200.147842 , 550.517334 , 73.053230 , 14.800020 , [[Camera:ScriptSplineModifyCursorSpeed(0.1);]] )
   Camera:MotionSpline_AddSplinePoint( 203.590775 , 554.505005 , 72.963242 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
