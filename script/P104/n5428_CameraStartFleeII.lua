-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 360.720978 , 429.517761 , 36.088482 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(227.607,508.141,74.000);]] )
   Camera:MotionSpline_AddSplinePoint( 360.720978 , 429.517761 , 36.088482 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 360.720978 , 429.517761 , 36.088482 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 360.720978 , 429.517761 , 36.088482 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 1.054688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
