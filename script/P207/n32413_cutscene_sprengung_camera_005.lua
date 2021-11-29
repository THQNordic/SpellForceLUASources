-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 534.986267 , 418.554504 , 69.945412 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(538.814,419.821,65.181);]] )
   Camera:MotionSpline_AddSplinePoint( 534.986267 , 418.554504 , 69.945412 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 534.986267 , 418.554504 , 69.945412 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 534.986267 , 418.554504 , 69.945412 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
