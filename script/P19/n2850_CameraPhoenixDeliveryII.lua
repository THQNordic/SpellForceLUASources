-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 380.251587 , 442.819092 , 78.185364 , 29.700077 , [[Camera:ScriptSplineLookAtPosition(382.256,454.864,78.384);]] )
   Camera:MotionSpline_AddSplinePoint( 381.986237 , 442.549835 , 79.185364 , 19.400038 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 383.780029 , 442.175812 , 79.185364 , 29.600077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 385.514801 , 441.906158 , 80.185364 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
