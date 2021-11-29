-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 132.057953 , 456.809814 , 31.062105 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(116.489,458.177,28.000);]] )
   Camera:MotionSpline_AddSplinePoint( 131.034332 , 460.449738 , 31.062105 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 128.146545 , 464.479065 , 31.062105 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 121.721588 , 467.010254 , 31.062105 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
