-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 235.107452 , 279.111816 , 17.651085 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(210.714,206.076,13.784);]] )
   Camera:MotionSpline_AddSplinePoint( 235.107452 , 279.111816 , 17.651085 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 235.107452 , 279.111816 , 17.651085 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 235.107452 , 279.111816 , 17.651085 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 6.523438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
