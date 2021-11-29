-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 403.500000 , 666.333313 , 29.299999 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(398.672,656.826,28.000);]] )
   Camera:MotionSpline_AddSplinePoint( 403.500000 , 666.333313 , 29.299999 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 403.500000 , 666.333313 , 29.299999 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 403.500000 , 666.333313 , 29.299999 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
