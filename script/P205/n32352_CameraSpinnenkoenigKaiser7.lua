-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 308.543793 , 590.107971 , 23.757927 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9305);]] )
   Camera:MotionSpline_AddSplinePoint( 308.543793 , 590.107971 , 23.757927 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 308.543793 , 590.107971 , 23.757927 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 308.543793 , 590.107971 , 23.757927 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
