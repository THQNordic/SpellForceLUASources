-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 473.974182 , 445.822968 , 31.376690 , 9.700001 , [[Camera:ScriptSplineLookAtPosition(447.092,451.673,30.187);]] )
   Camera:MotionSpline_AddSplinePoint( 473.974182 , 445.822968 , 31.376690 , 6.399996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 473.974182 , 445.822968 , 31.376690 , 9.600000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 473.974182 , 445.822968 , 31.376690 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
