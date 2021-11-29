-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 193.238388 , 470.571814 , 45.389954 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(193.2383,480.671,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 193.238388 , 470.571814 , 42.389954 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 193.238388 , 470.571814 , 39.389954 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 193.238388 , 470.571814 , 36.389954 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
