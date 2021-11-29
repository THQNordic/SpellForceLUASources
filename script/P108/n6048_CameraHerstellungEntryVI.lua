-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 234.474045 , 469.220154 , 66.058098 , 9.800001 , [[Camera:ScriptSplineLookAtPosition(231.518,478.665,63.960);]] )
   Camera:MotionSpline_AddSplinePoint( 234.179535 , 468.815063 , 65.616936 , 6.199996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 234.179535 , 467.815063 , 65.616936 , 9.700001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 234.179535 , 466.815063 , 65.616936 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
