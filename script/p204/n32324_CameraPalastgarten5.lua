-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 230.316696 , 479.096161 , 46.513908 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(207.775,477.857,50.000);]] )
   Camera:MotionSpline_AddSplinePoint( 230.316696 , 479.096161 , 46.513908 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 230.316696 , 479.096161 , 46.513908 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 230.316696 , 479.096161 , 46.513908 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
