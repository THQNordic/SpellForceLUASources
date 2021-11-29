-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 232.577911 , 279.071533 , 17.856504 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8683);]] )
   Camera:MotionSpline_AddSplinePoint( 232.576279 , 279.071503 , 17.856504 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 232.576279 , 279.071503 , 17.856504 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 232.576279 , 279.071503 , 17.856504 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 6.523438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
